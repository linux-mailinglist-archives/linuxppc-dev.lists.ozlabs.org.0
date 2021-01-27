Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7F30637E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 19:45:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQsx067gHzDr1N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:45:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hq9cayEC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQstq1FflzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 05:43:31 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B141601FB;
 Wed, 27 Jan 2021 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611773008;
 bh=GZ0Dc/tE/vX/hQMmkRpmanBmWtj6NrDessKfg0CzNQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hq9cayECysR7wC0JyvXib4KeHkGCaDldIGwVp3rDHBgGkQ1LymJfYzNCHYTWnOteh
 D/a4R7QdG6BOOOf3X8N/DYX4m5Ylj8hR8GIRpKFTInswxgi9aim5djfTEopswbiYBh
 5cA3sd60j8+bOtwsXdyKysCNG6+ZDeOICgWE8vnTanfwhOSE9JVUDFtyd3gYWECdt5
 uJ23zMZoj7kUW4bL5vIrmLcZeFPgxo+vAXyEmEU1WFwVLyjQQDigv+6af5vmTVauJf
 vhk8QGF8ckom1KSdAuAF9nbs/lM+XOOP1TzBNrf9cDTNKAeVMosfDtKRDoEL8tGPUi
 Tv/6eJXRVeqfg==
Date: Wed, 27 Jan 2021 18:43:20 +0000
From: Will Deacon <will@kernel.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v15 09/10] arm64: Call kmalloc() to allocate DTB buffer
Message-ID: <20210127184319.GA676@willie-the-truck>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
 <20210115173017.30617-10-nramas@linux.microsoft.com>
 <20210127165208.GA358@willie-the-truck>
 <d3330793-6054-6e59-b727-44bf8e5653cd@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3330793-6054-6e59-b727-44bf8e5653cd@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 frowand.list@gmail.com, sashal@kernel.org, robh@kernel.org,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 gregkh@linuxfoundation.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 09:59:38AM -0800, Lakshmi Ramasubramanian wrote:
> On 1/27/21 8:52 AM, Will Deacon wrote:
> 
> Hi Will,
> 
> > On Fri, Jan 15, 2021 at 09:30:16AM -0800, Lakshmi Ramasubramanian wrote:
> > > create_dtb() function allocates kernel virtual memory for
> > > the device tree blob (DTB).  This is not consistent with other
> > > architectures, such as powerpc, which calls kmalloc() for allocating
> > > memory for the DTB.
> > > 
> > > Call kmalloc() to allocate memory for the DTB, and kfree() to free
> > > the allocated memory.
> > > 
> > > Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> > > Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> > > Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> > > ---
> > >   arch/arm64/kernel/machine_kexec_file.c | 12 +++++++-----
> > >   1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> > > index 7de9c47dee7c..51c40143d6fa 100644
> > > --- a/arch/arm64/kernel/machine_kexec_file.c
> > > +++ b/arch/arm64/kernel/machine_kexec_file.c
> > > @@ -29,7 +29,7 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
> > >   int arch_kimage_file_post_load_cleanup(struct kimage *image)
> > >   {
> > > -	vfree(image->arch.dtb);
> > > +	kfree(image->arch.dtb);
> > >   	image->arch.dtb = NULL;
> > >   	vfree(image->arch.elf_headers);
> > > @@ -59,19 +59,21 @@ static int create_dtb(struct kimage *image,
> > >   			+ cmdline_len + DTB_EXTRA_SPACE;
> > >   	for (;;) {
> > > -		buf = vmalloc(buf_size);
> > > +		buf = kmalloc(buf_size, GFP_KERNEL);
> > 
> > Is there a functional need for this patch? I build the 'dtbs' target just
> > now and sdm845-db845c.dtb is approaching 100K, which feels quite large
> > for kmalloc().
> 
> Changing the allocation from vmalloc() to kmalloc() would help us further
> consolidate the DTB setup code for powerpc and arm64.

Ok, but at the risk of allocation failure. Can powerpc use vmalloc()
instead?

Will
