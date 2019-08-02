Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C47F7D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:06:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460S9T2MyCzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 23:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460RDk5tK9zDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 22:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 460RDj5TGBz9sDB;
 Fri,  2 Aug 2019 22:24:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2] PCI: rpaphp: Avoid a sometimes-uninitialized warning
In-Reply-To: <20190802001102.GG151852@google.com>
References: <20190603174323.48251-1-natechancellor@gmail.com>
 <20190603221157.58502-1-natechancellor@gmail.com>
 <20190722024313.GB55142@archlinux-threadripper>
 <87lfwq7lzb.fsf@concordia.ellerman.id.au>
 <20190802001102.GG151852@google.com>
Date: Fri, 02 Aug 2019 22:24:36 +1000
Message-ID: <87v9vfkb5n.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Mon, Jul 22, 2019 at 02:05:12PM +1000, Michael Ellerman wrote:
>> Nathan Chancellor <natechancellor@gmail.com> writes:
>> > On Mon, Jun 03, 2019 at 03:11:58PM -0700, Nathan Chancellor wrote:
>> >> When building with -Wsometimes-uninitialized, clang warns:
>> >> 
>> >> drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
>> >> used uninitialized whenever 'for' loop exits because its condition is
>> >> false [-Wsometimes-uninitialized]
>> >>         for (j = 0; j < entries; j++) {
>> >>                     ^~~~~~~~~~~
>> >> drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
>> >> here
>> >>         if (fndit)
>> >>             ^~~~~
>> >> drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
>> >> it is always true
>> >>         for (j = 0; j < entries; j++) {
>> >>                     ^~~~~~~~~~~
>> >> drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
>> >> 'fndit' to silence this warning
>> >>         int j, fndit;
>> >>                     ^
>> >>                      = 0
>> >> 
>> >> fndit is only used to gate a sprintf call, which can be moved into the
>> >> loop to simplify the code and eliminate the local variable, which will
>> >> fix this warning.
>> >> 
>> >> Link: https://github.com/ClangBuiltLinux/linux/issues/504
>> >> Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
>> >> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
>> >> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> >> ---
>> >> 
>> >> v1 -> v2:
>> >> 
>> >> * Eliminate fndit altogether by shuffling the sprintf call into the for
>> >>   loop and changing the if conditional, as suggested by Nick.
>> >> 
>> >>  drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
>> >>  1 file changed, 7 insertions(+), 11 deletions(-)
>> >> 
>> >> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
>> >> index bcd5d357ca23..c3899ee1db99 100644
>> >> --- a/drivers/pci/hotplug/rpaphp_core.c
>> >> +++ b/drivers/pci/hotplug/rpaphp_core.c
>> >> @@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
>> >>  	struct of_drc_info drc;
>> >>  	const __be32 *value;
>> >>  	char cell_drc_name[MAX_DRC_NAME_LEN];
>> >> -	int j, fndit;
>> >> +	int j;
>> >>  
>> >>  	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
>> >>  	if (info == NULL)
>> >> @@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
>> >>  
>> >>  		/* Should now know end of current entry */
>> >>  
>> >> -		if (my_index > drc.last_drc_index)
>> >> -			continue;
>> >> -
>> >> -		fndit = 1;
>> >> -		break;
>> >> +		/* Found it */
>> >> +		if (my_index <= drc.last_drc_index) {
>> >> +			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
>> >> +				my_index);
>> >> +			break;
>> >> +		}
>> >>  	}
>> >> -	/* Found it */
>> >> -
>> >> -	if (fndit)
>> >> -		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
>> >> -			my_index);
>> >>  
>> >>  	if (((drc_name == NULL) ||
>> >>  	     (drc_name && !strcmp(drc_name, cell_drc_name))) &&
>> >> -- 
>> >> 2.22.0.rc3
>> >> 
>> >
>> > Hi all,
>> >
>> > Could someone please pick this up?
>> 
>> I'll take it.
>> 
>> I was expecting Bjorn to take it as a PCI patch, but I realise now that
>> I merged that code in the first place so may as well take this too.
>> 
>> I'll put it in my next branch once that opens next week.
>
> Sorry, I should have done something with this.  Did you take it,
> Michael?  I don't see it in -next and haven't figured out where to
> look in your git tree, so I can't tell.  Just let me know either way
> so I know whether to drop this or apply it.

Yes I have it in my next-test, which will eventually become my next when
I get time to rebase it, test and push etc:

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next-test

So no further action required on your part.

cheers
