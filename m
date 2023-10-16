Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFEC7CA87E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:49:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=nCeqBJmd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8H500CJnz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:49:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=nCeqBJmd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62; helo=www62.your-server.de; envelope-from=daniel@iogearbox.net; receiver=lists.ozlabs.org)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8H2Z6DBXz3vnN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:47:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vTBYR5W87uJnQtpbq0bsqTJfD3ou9LZ0vu7LpthX5js=; b=nCeqBJmdNRsAlHhxOhJN1FlmeG
	GNXas+G0Nuj/ojpGAeebDBhXxSfWjS4qP6/X33SxNIprf6UQ9mOOiAfWkb049nYo68nkrxBB8A/zB
	bFr4tJ6qgwidktWnl5RFhXpYrjrjwjINHNR+M9ArDbYYXtDllsiNbrxpZ/ii27TiXV0csfha1tkdE
	Iqy0vuxBey4EdyjK2QXfiiuN+g45V9hgJjX/NgbB07tP3pZf9fKRsKursKaLIwvivwsmUxaI7CCo2
	QjDoqCx871QiCrNCh72GSptV2Kl0rrbdqTckNmOfHf/o1BLRASZ0yJPXYd/fDlraO/eIlQDadFDrT
	6CXkEVLA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qsN0b-000ErM-Si; Mon, 16 Oct 2023 14:47:45 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qsN0b-000MUc-KB; Mon, 16 Oct 2023 14:47:45 +0200
Subject: Re: [PATCH] arch: powerpc: net: bpf_jit_comp32.c: Fixed 'instead'
 typo
To: Muhammad Muzammil <m.muzzammilashraf@gmail.com>, martin.lau@linux.dev,
 yonghong.song@linux.dev, john.fastabend@gmail.com
References: <20231013053118.11221-1-m.muzzammilashraf@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <cc25e4b1-9079-1c45-b6d4-7f7f4701df0a@iogearbox.net>
Date: Mon, 16 Oct 2023 14:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20231013053118.11221-1-m.muzzammilashraf@gmail.com>
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/13/23 7:31 AM, Muhammad Muzammil wrote:
> Fixed 'instead' typo
> 
> Signed-off-by: Muhammad Muzammil <m.muzzammilashraf@gmail.com>

Michael, I presume you'll pick it up?

Thanks,
Daniel

> ---
>   arch/powerpc/net/bpf_jit_comp32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index 7f91ea064c08..bc7f92ec7f2d 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -940,7 +940,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   				 * !fp->aux->verifier_zext. Emit NOP otherwise.
>   				 *
>   				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
> -				 * if necessary. So, jump there insted of emitting an
> +				 * if necessary. So, jump there instead of emitting an
>   				 * additional "li reg_h,0" instruction.
>   				 */
>   				if (size == BPF_DW && !fp->aux->verifier_zext)
> 

