Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D557E717
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 02:12:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46070F1y3zzDqtR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 10:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="fnX7M40a"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4606yM6vmBzDqv4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 10:11:07 +1000 (AEST)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1394A2080C;
 Fri,  2 Aug 2019 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564704665;
 bh=eW7F5798CjDmOzeoFlM6FrvKP9mNOge+/pN3w8NdF/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fnX7M40ahP6OU1THYNFdxmP2J5YyI4SVk3AQpe5PtsvXXn18Gmw958x0rV+4pPEtV
 fs6jOO7LDQLcefUurUJwAPeBNfSXyYB6ah7LpSChj9V61/Wro8RtZnKpCzRlSLK5/k
 Gp/hmC8xYGjZTfPbM4pIVM0NKyj75fHSlFrC29uM=
Date: Thu, 1 Aug 2019 19:11:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] PCI: rpaphp: Avoid a sometimes-uninitialized warning
Message-ID: <20190802001102.GG151852@google.com>
References: <20190603174323.48251-1-natechancellor@gmail.com>
 <20190603221157.58502-1-natechancellor@gmail.com>
 <20190722024313.GB55142@archlinux-threadripper>
 <87lfwq7lzb.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfwq7lzb.fsf@concordia.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Jul 22, 2019 at 02:05:12PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > On Mon, Jun 03, 2019 at 03:11:58PM -0700, Nathan Chancellor wrote:
> >> When building with -Wsometimes-uninitialized, clang warns:
> >> 
> >> drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
> >> used uninitialized whenever 'for' loop exits because its condition is
> >> false [-Wsometimes-uninitialized]
> >>         for (j = 0; j < entries; j++) {
> >>                     ^~~~~~~~~~~
> >> drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
> >> here
> >>         if (fndit)
> >>             ^~~~~
> >> drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
> >> it is always true
> >>         for (j = 0; j < entries; j++) {
> >>                     ^~~~~~~~~~~
> >> drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
> >> 'fndit' to silence this warning
> >>         int j, fndit;
> >>                     ^
> >>                      = 0
> >> 
> >> fndit is only used to gate a sprintf call, which can be moved into the
> >> loop to simplify the code and eliminate the local variable, which will
> >> fix this warning.
> >> 
> >> Link: https://github.com/ClangBuiltLinux/linux/issues/504
> >> Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
> >> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> >> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> >> ---
> >> 
> >> v1 -> v2:
> >> 
> >> * Eliminate fndit altogether by shuffling the sprintf call into the for
> >>   loop and changing the if conditional, as suggested by Nick.
> >> 
> >>  drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
> >>  1 file changed, 7 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> >> index bcd5d357ca23..c3899ee1db99 100644
> >> --- a/drivers/pci/hotplug/rpaphp_core.c
> >> +++ b/drivers/pci/hotplug/rpaphp_core.c
> >> @@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
> >>  	struct of_drc_info drc;
> >>  	const __be32 *value;
> >>  	char cell_drc_name[MAX_DRC_NAME_LEN];
> >> -	int j, fndit;
> >> +	int j;
> >>  
> >>  	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
> >>  	if (info == NULL)
> >> @@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
> >>  
> >>  		/* Should now know end of current entry */
> >>  
> >> -		if (my_index > drc.last_drc_index)
> >> -			continue;
> >> -
> >> -		fndit = 1;
> >> -		break;
> >> +		/* Found it */
> >> +		if (my_index <= drc.last_drc_index) {
> >> +			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
> >> +				my_index);
> >> +			break;
> >> +		}
> >>  	}
> >> -	/* Found it */
> >> -
> >> -	if (fndit)
> >> -		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
> >> -			my_index);
> >>  
> >>  	if (((drc_name == NULL) ||
> >>  	     (drc_name && !strcmp(drc_name, cell_drc_name))) &&
> >> -- 
> >> 2.22.0.rc3
> >> 
> >
> > Hi all,
> >
> > Could someone please pick this up?
> 
> I'll take it.
> 
> I was expecting Bjorn to take it as a PCI patch, but I realise now that
> I merged that code in the first place so may as well take this too.
> 
> I'll put it in my next branch once that opens next week.

Sorry, I should have done something with this.  Did you take it,
Michael?  I don't see it in -next and haven't figured out where to
look in your git tree, so I can't tell.  Just let me know either way
so I know whether to drop this or apply it.

Bjorn
