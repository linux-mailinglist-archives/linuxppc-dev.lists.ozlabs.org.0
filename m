Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D14A79E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 21:59:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpvLr0BLCz3cX2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 07:59:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codon.org.uk (client-ip=176.126.240.207; helo=cavan.codon.org.uk;
 envelope-from=mjg59@codon.org.uk; receiver=<UNKNOWN>)
X-Greylist: delayed 11304 seconds by postgrey-1.36 at boromir;
 Wed, 02 Feb 2022 18:10:26 AEDT
Received: from cavan.codon.org.uk (cavan.codon.org.uk [176.126.240.207])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpXxt1wBFz30Dg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 18:10:26 +1100 (AEDT)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
 id 56FE540A51; Wed,  2 Feb 2022 07:10:23 +0000 (GMT)
Date: Wed, 2 Feb 2022 07:10:23 +0000
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <20220202071023.GA9489@srcf.ucam.org>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfotMyQiQ66xfCOQ@kroah.com>
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
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, dja@axtens.net, Dave Hansen <dave.hansen@intel.com>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 08:05:23AM +0100, Greg KH wrote:

> I see different platform patches trying to stick these blobs in
> different locations and ways to access (securityfs, sysfs, char device
> node), which seems crazy to me.  Why can't we at least pick one way to
> access these to start with, and then have the filesystem layout be
> platform-specific as needed, which will give the correct hints to
> userspace as to what it needs to do here?

Which other examples are you thinking of? I think this conversation may 
have accidentally become conflated with a different prior one and now 
we're talking at cross purposes.
