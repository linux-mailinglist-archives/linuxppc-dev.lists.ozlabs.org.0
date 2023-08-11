Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EE778FA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 14:37:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IkadJ0VJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMjwp75Vkz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 22:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IkadJ0VJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMjvv4TZSz2yZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 22:36:27 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RMjvv3kylz4wqX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 22:36:27 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RMjvv3bPfz4wxn; Fri, 11 Aug 2023 22:36:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IkadJ0VJ;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RMjvt5yPjz4wqX
	for <linuxppc-dev@ozlabs.org>; Fri, 11 Aug 2023 22:36:26 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99d6d5054bcso306656066b.1
        for <linuxppc-dev@ozlabs.org>; Fri, 11 Aug 2023 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691757383; x=1692362183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w2RxzAZJCwD+uKG4ua609ocksu+0Co5/wex/kCYChjo=;
        b=IkadJ0VJJAoJvtOsAeZz83WIEAUXiq+JhbkZ2POXP6FHPl2c9vlqWDovYK6fgFc85M
         V3nm61XPntfrvWl4mmdvgM5yQZzOQVZe/+xCoq0rrKylowF2r7SZC/UvUnMXw8MnNoRP
         sC0iEW6wvfR3yQA3htpKuoNiIh10smIsCDRXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691757383; x=1692362183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2RxzAZJCwD+uKG4ua609ocksu+0Co5/wex/kCYChjo=;
        b=FR+Pxwaozcp42O/jzVkhTCorRsfftMRnZ1VhGFaEo1/wZItC8eWr+OC/GfE8ye6cza
         j3caYGH38ze1DopUD0zalKshJWSrlFQGQ2W51uWyqt8dArPwZM+I5T+IE27zpjdsLHME
         7/PQveq28wBWVxUqCFEg6AHJ76meLuHQm9Hk85axNo+m5LOSgMtaN35ChBB2If9wafHM
         XXBrOfq+B/Y5RaFUItlRlkPm0+XXdCo8aAnG4YCixeGcvhc2b9zB3li6986VKzczrSsJ
         1lywq8+qVQ9tDSivCuwCaYIXzptBe+dosIrl9+wL1wNeeLP6A6K6ORSLRJMTPU2xARWR
         5ZxQ==
X-Gm-Message-State: AOJu0Yybs2KgiGdh2y0x5Bf+UiEsciAWhbFokwBB9oK53rQjWHYivLmQ
	IJYbQxA8ZljAk7EsoVUnnSaICDthCuoDuwThwRE=
X-Google-Smtp-Source: AGHT+IHhQG9DlMfHn78215vPOnRLzsWlzZfzLWwNlFoAwVHMEWKb9bT8SHFfrzaLlDGGi0Mc4pZreWKtwa/VVVtCt2Q=
X-Received: by 2002:a17:907:2cc1:b0:99c:602b:6a6d with SMTP id
 hg1-20020a1709072cc100b0099c602b6a6dmr2157390ejc.11.1691757382453; Fri, 11
 Aug 2023 05:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <168870663097.1448934.17365533203887616941.stgit@jupiter>
In-Reply-To: <168870663097.1448934.17365533203887616941.stgit@jupiter>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Aug 2023 12:36:09 +0000
Message-ID: <CACPK8XdP5keaUsP3cNY601P=uhDU_jj47rhies5QOojbU5ZSAw@mail.gmail.com>
Subject: Re: [PATCH v2] powernv/opal-prd: Silence memcpy() run-time false
 positive warnings
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, Jordan Niethe <jniethe5@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 7 Jul 2023 at 05:11, Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>
> opal_prd_msg_notifier extracts the opal prd message size from the message
> header and uses it for allocating opal_prd_msg_queue_item that includes
> the correct message size to be copied. However, while running under
> CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:
>
> [ 6458.234352] memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
> [ 6458.234390] WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
> [...]
> [ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 [opal_prd]
> [ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd]
> [ 6458.234736] Call Trace:
> [ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
> [ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] notifier_call_chain+0xc0/0x1b0
> [ 6458.234774] [c0000002acb23d00] [c00000000019ceac] atomic_notifier_call_chain+0x2c/0x40
> [ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] opal_message_notify+0xf4/0x2c0
> [...]
>
> Split the copy to avoid false positive run-time warning.
>
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

I hit this on a box running the Ubuntu 6.2.0-27-generic kernel.

Do we plan on merging this fix?



> ---
> Change from v1:
> - Rework the memcpy to copy message header and rest of the message
>   separately without adding flex array.
> ---
>  arch/powerpc/platforms/powernv/opal-prd.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
> index 113bdb151f687..a068cbc4d43c0 100644
> --- a/arch/powerpc/platforms/powernv/opal-prd.c
> +++ b/arch/powerpc/platforms/powernv/opal-prd.c
> @@ -352,7 +352,9 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
>         if (!item)
>                 return -ENOMEM;
>
> -       memcpy(&item->msg, msg->params, msg_size);
> +       item->msg = *hdr;
> +       hdr++;
> +       memcpy((char *)&item->msg + sizeof(*hdr), hdr, msg_size - sizeof(*hdr));
>
>         spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
>         list_add_tail(&item->list, &opal_prd_msg_queue);
>
>
