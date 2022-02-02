Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A254A79DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 21:58:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpvKG0T9Jz3bdG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 07:58:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (access neither permitted nor denied)
 smtp.mailfrom=codon.org.uk (client-ip=2a00:1098:84:22e::2;
 helo=cavan.codon.org.uk; envelope-from=mjg59@codon.org.uk; receiver=<UNKNOWN>)
X-Greylist: delayed 826 seconds by postgrey-1.36 at boromir;
 Wed, 02 Feb 2022 15:15:57 AEDT
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpT4Y4cWPz303n
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 15:15:57 +1100 (AEDT)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
 id 394B740A4A; Wed,  2 Feb 2022 04:01:57 +0000 (GMT)
Date: Wed, 2 Feb 2022 04:01:57 +0000
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <20220202040157.GA8019@srcf.ucam.org>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 gcwilson@linux.ibm.com, Ard Biesheuvel <ardb@kernel.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, dja@axtens.net, Dave Hansen <dave.hansen@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 01, 2022 at 09:24:50AM -0500, James Bottomley wrote:
> On Tue, 2022-02-01 at 14:50 +0100, Greg KH wrote:
> > You all need to work together to come up with a unified place for
> > this and stop making it platform-specific.

We're talking about things that have massively different semantics. How 
do we expose that without an unwieldy API that has to try to be a 
superset of everything implemented, which then has to be extended when 
yet another implementation shows up with another behavioural quirk? EFI 
variables already need extremely careful handling to avoid rm -rf /sys 
bricking the system - should we impose that on everything, or should we 
allow the underlying implementation to leak through in some ways?
