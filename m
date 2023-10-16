Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2AF7CA7F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:29:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=mgT5JJOA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Gd31jNZz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:29:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=mgT5JJOA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62; helo=www62.your-server.de; envelope-from=daniel@iogearbox.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 1275 seconds by postgrey-1.37 at boromir; Mon, 16 Oct 2023 23:28:26 AEDT
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8GcB0fTqz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:28:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TEnSZIvpSmwaN7cCqVlIu4FsV7ACOF+OL3jC1tuaUH0=; b=mgT5JJOALKatilAZzAvSwnGGcO
	F1fn4cXst/MP3vXLygT0dFa0Vs1EV75pevRhCX7mfEXJ3C3g7fgrH8nmZE+FXVAIPbnrIMLqoadnC
	xmYQJOxvQvBsb+PU8orK1E4xDVMTQ7D1zeMXRabULVyuFn9uVENytWZKJQ+JUHCdnha6KbG46C37K
	nyVPRrs9r5ZxRV3Bue+ue12o3pZBmk+esjDRCfTsvWxUiiXnTuSD3S4ZuFZI8g+wAUwFkQUjizKFn
	ADS1r2HhxyyNyf+J4Uz+p0FaDTAtLYrPnewuHUrL/09rnXhoP+tRzV8RgrjQZBVKR6rN+QCAxwd8D
	2mVxKTjw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qsMND-000ALG-Pl; Mon, 16 Oct 2023 14:07:03 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qsMND-000F9v-E0; Mon, 16 Oct 2023 14:07:03 +0200
Subject: Re: [PATCH v6 0/5] powerpc/bpf: use BPF prog pack allocator
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
References: <20231012200310.235137-1-hbathini@linux.ibm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <140a1e76-dfa4-d20e-fc10-09b4f3a85cb4@iogearbox.net>
Date: Mon, 16 Oct 2023 14:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20231012200310.235137-1-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27063/Mon Oct 16 10:02:17 2023)
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/12/23 10:03 PM, Hari Bathini wrote:
> Most BPF programs are small, but they consume a page each. For systems
> with busy traffic and many BPF programs, this may also add significant
> pressure on instruction TLB. High iTLB pressure usually slows down the
> whole system causing visible performance degradation for production
> workloads.
> 
> bpf_prog_pack, a customized allocator that packs multiple bpf programs
> into preallocated memory chunks, was proposed [1] to address it. This
> series extends this support on powerpc.
> 
> Both bpf_arch_text_copy() & bpf_arch_text_invalidate() functions,
> needed for this support depend on instruction patching in text area.
> Currently, patch_instruction() supports patching only one instruction
> at a time. The first patch introduces patch_instructions() function
> to enable patching more than one instruction at a time. This helps in
> avoiding performance degradation while JITing bpf programs.
> 
> Patches 2 & 3 implement the above mentioned arch specific functions
> using patch_instructions(). Patch 4 fixes a misnomer in bpf JITing
> code. The last patch enables the use of BPF prog pack allocator on
> powerpc and also, ensures cleanup is handled gracefully.
> 
> [1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/
> 
> Changes in v6:
> * No changes in patches 2-5/5 except addition of Acked-by tags from Song.
> * Skipped merging code path of patch_instruction() & patch_instructions()
>    to avoid performance overhead observed on ppc32 with that.

I presume this will be routed via Michael?

Thanks,
Daniel
