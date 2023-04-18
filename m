Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199166E7896
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dld5NmMz3frl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:26:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SvOVsXMy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SvOVsXMy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1BMR1vKRz3cV7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 03:52:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55F3160AD5;
	Tue, 18 Apr 2023 17:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB764C433D2;
	Tue, 18 Apr 2023 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681840334;
	bh=za1o6VU2W+1EIlPlbU3wstltJzV9dcg9Lopt3PW9kmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvOVsXMygNxTEp9k7Wj/s/hUUN8YX7V8VxpGwhKUSynCvUC7/ixbWVXJyvcwljW6E
	 w1rImy+t4HaXTEZs84/pNB9Dgu0MV1VCMg23uoNUKVk1IgmibJa2U2V2K6oCRd4bDE
	 1EfeV9Y8EwW5X2M3QR1Fq08uYWzSkk7eIQUhnMiMhx3CxwIQRZwSvYgSujN2xO+mAu
	 7wI1z1xFLLgMfeS0FSqFPSovvextNNQoiGmAv103OFTB+Ex4GU24HfM8p61qewXFIj
	 VjMojg6+fJsKQD60Ul9RDX3dGz+ZdNFLuL92YS7XHWGB2SAv+avwCimzhsBotl6HeN
	 fvRcJZkVw45yA==
Date: Tue, 18 Apr 2023 19:52:09 +0200
From: Simon Horman <horms@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v9 4/4] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Message-ID: <ZD7YybmnioAs0yKR@kernel.org>
References: <20230418134409.177485-1-stefanb@linux.ibm.com>
 <20230418134409.177485-5-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418134409.177485-5-stefanb@linux.ibm.com>
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: devicetree@vger.kernel.org, Coiby Xu <coxu@redhat.com>, Frank Rowand <frowand.list@gmail.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Eric Biederman <ebiederm@xmission.com>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 18, 2023 at 09:44:09AM -0400, Stefan Berger wrote:
> The memory area of the TPM measurement log is currently not properly
> duplicated for carrying it across kexec when an Open Firmware
> Devicetree is used. Therefore, the contents of the log get corrupted.
> Fix this for the kexec_file_load() syscall by allocating a buffer and
> copying the contents of the existing log into it. The new buffer is
> preserved across the kexec and a pointer to it is available when the new
> kernel is started. To achieve this, store the allocated buffer's address
> in the flattened device tree (fdt) under the name linux,tpm-kexec-buffer
> and search for this entry early in the kernel startup before the TPM
> subsystem starts up. Adjust the pointer in the of-tree stored under
> linux,sml-base to point to this buffer holding the preserved log. The TPM
> driver can then read the base address from this entry when making the log
> available. Invalidate the log by removing 'linux,sml-base' from the
> devicetree if anything goes wrong with updating the buffer.
> 
> Use subsys_initcall() to call the function to restore the buffer even if
> the TPM subsystem or driver are not used. This allows the buffer to be
> carried across the next kexec without involvement of the TPM subsystem
> and ensures a valid buffer pointed to by the of-tree.

Hi Stefan,

some minor feedback from my side.

> Use the subsys_initcall(), rather than an ealier initcall, since

nit via checkpatch.pl --codespell: s/ealier/earlier/

> page_is_ram() in get_kexec_buffer() only starts working at this stage.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Tested-by: Coiby Xu <coxu@redhat.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

...

> +void tpm_add_kexec_buffer(struct kimage *image)
> +{
> +	struct kexec_buf kbuf = { .image = image, .buf_align = 1,
> +				  .buf_min = 0, .buf_max = ULONG_MAX,
> +				  .top_down = true };
> +	struct device_node *np;
> +	void *buffer;
> +	u32 size;
> +	u64 base;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_PPC64))
> +		return;
> +
> +	np = of_find_node_by_name(NULL, "vtpm");
> +	if (!np)
> +		return;
> +
> +	if (of_tpm_get_sml_parameters(np, &base, &size) < 0)
> +		return;
> +
> +	buffer = vmalloc(size);
> +	if (!buffer)
> +		return;
> +	memcpy(buffer, __va(base), size);
> +
> +	kbuf.buffer = buffer;
> +	kbuf.bufsz = size;
> +	kbuf.memsz = size;
> +	ret = kexec_add_buffer(&kbuf);
> +	if (ret) {
> +		pr_err("Error passing over kexec TPM measurement log buffer: %d\n",
> +		       ret);

Does buffer need to be freed here?

> +		return;
> +	}
> +
> +	image->tpm_buffer = buffer;
> +	image->tpm_buffer_addr = kbuf.mem;
> +	image->tpm_buffer_size = size;
> +}
