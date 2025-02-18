Return-Path: <linuxppc-dev+bounces-6285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DFA3906A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 02:35:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxhsv2DVRz2yZ4;
	Tue, 18 Feb 2025 12:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739842515;
	cv=none; b=Zhpf3jK8fsFjZHYZOcNLwoIym80p8vSC4TityIFK9GKnec3DHJUwFnfwVzwE4DXI90pkKPl/FrhT3po/enejzTQ98qtEpvWa5prymNikacXXV1eBiWOb0UHzQ1udmVFB18T2kvBeVGp+WEPuf9lCRC4ALPoK6ja1OVek12SHZi8Qun7UejvcX5iwctI9sjZH2gY44lLWW4ZonWhAdyfoZEWmQmFrmjRU/ES91M6kB4C2/raPX5nZro0GAJaq9+XfIlrxu0CfjCNBvkAQ+F3Xdps7yNIhExVVO081aVg4pzUIeE/P9Pmn6nw3GkY6zZFDkfkne3rGG37nBSh9dNs+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739842515; c=relaxed/relaxed;
	bh=S7njOX2eASpcgHqJMgTlz2hxo3kaoAVN0RBbf2xHE3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=UZpSKr3LsT9xOA1jqEuyZQMQAShCddsPnzWqzHdln5axEyqbwx3iOD8ojfqIoi32vhZCNUFS7nMrJxdL9tYuqYAT/HkdT7HKSa4uM0YNGRSv2CyQBU38LBn5D8LWbKSeI03M18IFHQNlXeZUkaE8J/msqSYQ9NvYgXfvoAnMJiuB7Rrhm1Hye128qUOLosATQ6m+x5VnUy5+ec2TMahEiTXNUcS0bZNk7e+FFIWzPL1SGvNQC67CndHnK6q+OirbV+ByZLb9bSOjH67osIPv+dLlPUfckwpi+/scoVni2VvKddyvN2Isn7Kwfx5Q6QAXQjRFod/+nF4QzIB38E/tPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JM+06ejy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JM+06ejy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxhst4N6Lz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 12:35:14 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so6692011a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 17:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739842512; x=1740447312; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7njOX2eASpcgHqJMgTlz2hxo3kaoAVN0RBbf2xHE3g=;
        b=JM+06ejyjK76HRegLL/cPA+1uY48XyQzXi0OJuito9+Ck2bK6r+rFP4I7sua6lq+k8
         xL1uh67618dnJMnDMxYZ45UKPaFy+GmUsaN66i+Tvz2bzyu8hsYq2gZlYdCbCSaSET81
         QtdKVw8nwefWXcQqp0UDm83Sn8BHVqMl039Nvlaq1BDOr1XVWoHZZQ0u36vPzyQXDBUG
         wMOe/Lo/qjIPcQIA1SBpAStADY2TNvJqDEKiuMQ+q5/o8c9d4Q2G8dbDUodO/gNmoGmR
         DIvfYWLOrCaqC3LwM0lV9X89zhGcSzq3OXau55vZXo6CtBBlIjFJu/YQm55JDbzdraHW
         MQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739842512; x=1740447312;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S7njOX2eASpcgHqJMgTlz2hxo3kaoAVN0RBbf2xHE3g=;
        b=b8i4Mu1P1vsaARP6dlOlgb/QoPdYjtRQXWY0Tv0TCYV++Y3bc+WkPxBv9hoRHO4CzR
         fp96LWmDnRVeeXknPLkgAND8I2hnFgecBBmw0TFIb4vk3kf8qFY97iockNwU4OJkd282
         WPFtVYsKdmqbtIU+rmXtPMzR2vPli3INOb8HiG6K8Q+dv96nK7qL2r6emivIQMe76D6p
         LpDJleeFyUf+oxuocGpgydiNJPyc+ecqJ4468Ny2PjzJmW+Jts4wTR0ayBQeQDZU5o3v
         cZ+TvldCoIbQ0pTHunQOk4BNormqY/q/BpjjzQmkcjuf4KJEqan48VZpinuVkYo2B8r8
         ML2A==
X-Forwarded-Encrypted: i=1; AJvYcCVoyhxduGNRR5c735ltcgmLKQqTJf66hAJa3yDkxMBUy9/DrtVp/TtaZ1/aSCx6eXTTldbyO+65/3p4He0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRRChFpKhGOipZuYzwYXy4b70xVuOQlF9KJK2wfj9W95m4OQzk
	w71CKTAcZRHMsK7XFpGOb4Cv/rc6ydWTeXzZD8El9uCB7CmbCVZciUhzsQ==
X-Gm-Gg: ASbGncuDlX30TiNHOfbcEnS9uRvV0yUpZruASiAaW9vn/h5rKazU6qY9c1TZRkYsj+a
	5xXvrNhGWMgn9/WXZG253ZVzcZa1MfVrvI3B/KKhUAuXrFY0n1gpqyVuTm5rK4pfG4oshRhvik7
	Ts/K4T3pEUN4f0Ury3uFJnBtQ+7ECmxdtMXUnTjOLRgksjQzxWGIcdSDZLdUdeNimCuh3s8QeC1
	O+QbvhH6/iBpFgg4ZhUc1XJDFl2SOUBDndKzhLMpU3lBO2M8VqBZCSGJy4AdLCkczoH6rEGMEYc
	fw2rqWuDjPE=
X-Google-Smtp-Source: AGHT+IFe/zZMlAoTfTxIrbPaSOcdtovWKBuvbWSyH14vq8YTFrSHmoPP3uJc39SFR8b30NkHmRdj8w==
X-Received: by 2002:a17:90b:3d8f:b0:2fc:aaf:74d3 with SMTP id 98e67ed59e1d1-2fc0f922439mr30218402a91.4.1739842512435;
        Mon, 17 Feb 2025 17:35:12 -0800 (PST)
Received: from localhost ([118.209.251.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ad4384sm8834057a91.22.2025.02.17.17.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 17:35:12 -0800 (PST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 11:35:08 +1000
Message-Id: <D7V6P2GXV4Z3.1GWB8AYAOUT61@gmail.com>
Subject: Re: panic in cpufreq_online() in 6.14-rc1 on PowerNV
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Dan_Hor=C3=A1k?= <dan@danny.cz>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.19.0
References: <20250206094148.787dbdaa0580d7ed6c510709@danny.cz>
In-Reply-To: <20250206094148.787dbdaa0580d7ed6c510709@danny.cz>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu Feb 6, 2025 at 6:41 PM AEST, Dan Hor=C3=A1k wrote:
> Hi,
>
> I am getting a kernel panic on my Raptor Talos Power9 system after
> updating to the 6.14-rc1 kernel from 6.13. Seems reproducable every
> time, but I haven't start bisecting yet. Does it sound familiar to
> anyone?

No, but it's possible it could be skiboot changes in PM code.

Thanks,
Nick

