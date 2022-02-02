Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ECE4A79E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 22:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpvMH0LTDz3cRv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 08:00:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (access neither permitted nor denied)
 smtp.mailfrom=codon.org.uk (client-ip=2a00:1098:84:22e::2;
 helo=cavan.codon.org.uk; envelope-from=mjg59@codon.org.uk; receiver=<UNKNOWN>)
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpZ7m1Ck0z30NC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 19:04:04 +1100 (AEDT)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
 id A3FF540A51; Wed,  2 Feb 2022 08:04:01 +0000 (GMT)
Date: Wed, 2 Feb 2022 08:04:01 +0000
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <20220202080401.GA9861@srcf.ucam.org>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com>
 <20220202071023.GA9489@srcf.ucam.org>
 <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 03 Feb 2022 07:58:06 +1100
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Lenny Szubowicz <lszubowi@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, gcwilson@linux.ibm.com,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>,
 Dave Hansen <dave.hansen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 08:22:03AM +0100, Ard Biesheuvel wrote:
> On Wed, 2 Feb 2022 at 08:10, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> > Which other examples are you thinking of? I think this conversation may
> > have accidentally become conflated with a different prior one and now
> > we're talking at cross purposes.
> 
> This came up a while ago during review of one of the earlier revisions
> of this patch set.
> 
> https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/
> 
> which describes another two variations on the theme, for pKVM guests
> as well as Android bare metal.

Oh, I see! That makes much more sense - sorry, I wasn't Cc:ed on that, 
so thought this was related to the efivars/Power secure boot. My 
apologies, sorry for the noise. In that case, given the apparent 
agreement between the patch owners that a consistent interface would 
work for them, I think I agree with Greg that we should strive for that. 
Given the described behaviour of the Google implementation, it feels 
like the semantics in this implementation would be sufficient for them 
as well, but having confirmation of that would be helpful.

On the other hand, I also agree that a new filesystem for this is 
overkill. I did that for efivarfs and I think the primary lesson from 
that is that people who aren't familiar with the vfs shouldn't be 
writing filesystems. Securityfs seems entirely reasonable, and it's 
consistent with other cases where we expose firmware-provided data 
that's security relevant.

The only thing I personally struggle with here is whether "coco" is the 
best name for it, and whether there are reasonable use cases that 
wouldn't be directly related to confidential computing (eg, if the 
firmware on a bare-metal platform had a mechanism for exposing secrets 
to the OS based on some specific platform security state, it would seem 
reasonable to expose it via this mechanism but it may not be what we'd 
normally think of as Confidential Computing).

But I'd also say that while we only have one implementation currently 
sending patches, it's fine for the code to live in that implementation 
and then be abstracted out once we have another.
