Return-Path: <linuxppc-dev+bounces-13999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA2C46024
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mSl294cz2xqv;
	Mon, 10 Nov 2025 21:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762768715;
	cv=none; b=PEMX+P8gakTxc/v2il5U7tA/WhuCP3hn5lcj/DHt244+mw8PFW+7J4ueK82YdsOgP8Arv+jaDOXH9fISwFQGgOXwRYIY/ZEaLDyt7er4EBDcaDXK51txw7BkyPJ/w14t9lnDjTVVTXsfxhvJIeyJo1DLXcwcM9uJklpxXVyUnN9L8IpUGgyK1kQbQ4cHm29JWEJvqcXYrTAHBVC0KMNbuHWJY9ATOr1iryXBeR8B70ZlJbGTGpRV7JKlFeAqSYr0tIDrCFmrK1JCTk+4xOh/H3zCZUc8q/159SGOdl4fMEWqxNuX95A+Nj3fHAiaFIgrnPuciJOKJR/7k6K2FGP9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762768715; c=relaxed/relaxed;
	bh=Pr1wJd/7uGgpha5iPQ4Q3WZe4ih/H/T0063vCmTBsVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qym37MlZMeyaEnErsVCZzmte6NL9r1p57L2FalUwFdmW7ANxIHjhbGG0WJHyAEndZu4ZpQRhIKgDeS57s+KEo5WuBO4zdhcs+L2K2ybgM36rnSIYienlQHvYZIATtqv3pdAxTIj+Vfa3ismewNmiSv+fk1S3im/lRxrTYvDqOfpjbT4Cr2ydDhjiPrwoDOg6ICmWwUDS5AcDKgaXNwtjlWbZ7rlprSqMzcYGhjms+WCSMoMzd7lsB3s8QUTz+Uw8PgCrKqmJNLqEiOKIeBQbTnrpBtIYJFn+bl9nWIVlxkMsQ4aZu0F7KYlLfJ5CcXctEZT35FnDfFOxCnzrxkPwQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eIpcuwQ7; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eIpcuwQ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4lVJ6xWhz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 20:58:31 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5942bac322dso2386618e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 01:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762768703; x=1763373503; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pr1wJd/7uGgpha5iPQ4Q3WZe4ih/H/T0063vCmTBsVQ=;
        b=eIpcuwQ7UFehQOIUL2raqcbtQZ+NDm1sP4yzhjcimKrd7lgTQO2lcGrhbdX1JCW0+R
         DMsZPg36Seze7so8XC0lLdgJPXwnFkQwZKyOxHPBjLPO7reNAi2FWfFtOxQQrdk2sg1S
         zWsynYtOkTqELWojpyfy9/VC5b4b2EXRymyWR9zmIrx/aoCdCLRKzxGzXAcYJikT8auZ
         bJDTPPGt/azZ/8qCwd31VWgbp2nRnimq9hfY5mBegvCosgaPg6loxHTfiI/OtpASGw5W
         KasqeqjbBoVSfMjd2Rirjh2R0F365oqU5jsNTzt5XPbK9+s0J+/B2i7cnypQOLvzwQOj
         S9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762768703; x=1763373503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pr1wJd/7uGgpha5iPQ4Q3WZe4ih/H/T0063vCmTBsVQ=;
        b=OQ9rknbBnZIRC4yFd570Wa2Vicm5Ku8kaq8wIIR3p4E+jUCNnGBfyL9zH9mc7PQO2R
         WiclkZ18T4/HcwxqtsD5hf45lzzK+AzOGO3PKcDoduV83KZTZCds1+kGQoz6SGyAr0dz
         zzm/SnQNytq0er3i6kNcpMNlHWBxtq7r2uM95U7gdDHHOx5ASYhYkscmYedH+vYPYdz+
         KlDXuTuTsHwzVIBUNpxrZydP19T4tbWRVqiABjiO2gmhKHpxJO6Kynl62jtdkaR3zj5M
         UbSjAntso9kdJt0VODHanz7CXtr/amT6RgAv8PHUeDICLurrEYqmaQB5qgUw+wJ8sRsA
         bqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAFZq9KEpSHS9OYXY4lL+zKj0kCpEpDE/r+pOzcxE9yEldXcBbnA88wRoYdf3v8sH2J17/AWXC3AZtvyc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUHyxB5dtOVXjg7Ev/4i+AbCewuEbDe+LCSTWF59yTy/NnrGT6
	mlxyu50drxYfl6FExaTM9s297m7rMxIJf98zVMPw6CdB7B+ijtIOFwZyD7PvjrA8pvPycqLK047
	V0umT9L3gf5nqb4qNetgQ8yQFo8WcJzVTNgi+RagpGw==
X-Gm-Gg: ASbGncviWzESkrtofZAJmOWckUeM1q2QJiQMjVKnGKY1OEA/yAIBJ8MkBYphVggxAsJ
	nO1t3aEcsJdq1sYIBwtfuf3CTVzui6F/KovZfsdiae5qK1pUmwlqHz15N8t2LKnSLJJUciFXiD1
	aV4ZMu7or/9cXraxfO2CRaxJlCnS8wumbsEP55betQQVm09uPRIYJNT4ro4DlSE7nNcIfIt7WsB
	z+34eca8DDauOiDr09nwW9ywfq3mzl/ZzMiNY5t4VCQ3V/AmP6FYARcYFmiz3dcBw7LJeNk9kXR
	C185v8XUojw3AdkDE74rMujq2W64
X-Google-Smtp-Source: AGHT+IH8nzVycdeOgzQi/3FgjBc86W9BwlRBJUJ1/mzPe889ufxIQJ9HVlvKbWPBD1jcEM/roczq0ZhI9VyTgtrOyjM=
X-Received: by 2002:a05:6512:3d04:b0:594:2df2:84ab with SMTP id
 2adb3069b0e04-5945f186cb5mr2251235e87.8.1762768702626; Mon, 10 Nov 2025
 01:58:22 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251107152950.293899-1-marco.crivellari@suse.com> <64df8b4e-6cd4-49e4-a0f9-c8f9c017b06c@csgroup.eu>
In-Reply-To: <64df8b4e-6cd4-49e4-a0f9-c8f9c017b06c@csgroup.eu>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 10 Nov 2025 10:58:11 +0100
X-Gm-Features: AWmQ_blCrzzwtNXT5OJKtaKmerZRqaCu4AKrtikaapFNCbK_j5LVXjJ3X5YXl6U
Message-ID: <CAAofZF4QD_vAon4CpHPQCPpgQpp991QOJ-Zd=Qn0siaWz+jtDg@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 8, 2025 at 8:44=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> IIUC this patch is part of a wide work on workqueues. I assume the will
> go via the workqueue tree. Let me know if you want me to take it via soc
> fsl.
>
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi,

Every maintainer is using its own tree, so I think it is fine if you
use soc fsl.
The change here is indeed under soc fsl, adding explicitly WQ_PERCPU.

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

