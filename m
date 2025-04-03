Return-Path: <linuxppc-dev+bounces-7439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C137A7AEAF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 22:33:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTD2p2hYQz304x;
	Fri,  4 Apr 2025 07:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743712402;
	cv=none; b=bA07rXosTb/3hj8PFMTbLoiSD20IQhdpoO6zEfJaYPw7igymoUGiYwhFT6lNf61yQK2pow4rjL7VBCm0vV3SHuJ0p+MtfvhmuizTFg26SPKCMKL8E8HJ6APrjU5XSiitOtBDL7p+kbzP60sEAa1yLjH0XSZaQcmzbozdgtldixKX4MZihhPjNFaUNgxSbR6quFurHGa1erLcmQ17kwd6zegatn2MXcgjEfT40A/KYw9XR/LchbTvZ5FlT0vsDWBKqDV2b+UXsaYPRFvBa2erbWU2ywOB6V/mVRtcMdm70q8ul9013LXxSWdnMGUsG5oPlAatkcwnnf+M5PEAjbwwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743712402; c=relaxed/relaxed;
	bh=ur2Tr6iw7X46fc/5bRLx6fdqJrE0cltK+bwwRImun+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKhpIF85ACu5fpj1e2PAhbsspq2qQrmO6ZOeLZOYe70UTZMkiRX2fJrjGvy3OhQSOKFxRsqrRaWiK6S/MLqNDuOZBukkiieAZuJqBhZ6iOX9VywvCH47EOpfr+2QIMwgFfCjxX19MoxQK+/VKg43BY61cbI7eeLk4IKf58GdaQLqpaQiVBN8Brv6KkiL2PZdlAtsofDOdfZq+HBVZ4uNUn+ICe+Aqg5BUjK18h1T91PQEmIIQNC0vmkV2bVLYrLLOhSGPqHVqM/nMAr9fOcKRV1t8tL+dm3gWRZMq3HBjl+CgG303N/utzTNOxWphxL+ws+qYrmC9EcmWGlvCeyGlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NMjFSgTq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NMjFSgTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTD2m2FJqz2ySF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 07:33:19 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c1efc457bso828295f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Apr 2025 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743712394; x=1744317194; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur2Tr6iw7X46fc/5bRLx6fdqJrE0cltK+bwwRImun+Q=;
        b=NMjFSgTq3PoZYqs1M4z+dMDfedb7AoFOaBzIB3AIfpgJN5sblOUjnst1bWMnmk/K+/
         nBS7OFzbu27Zuy2PgRAR+Gntd4BRbUexnyPSnsmObHx1Il8XpkHfTkIsgt0bbHtAl5qO
         Xvl2tJvZYFvQ8vZ8DmwL7xA6/ypug1AvYy4eTIAdqpt7T82ioUNjJnhilkD8WJwMbJJH
         LGnAyCDngU0dn4e1JN3zgGh+DXnb4gLte8d9D7VEzfHoa+exbpDSIfiZpkVXTPRtCwfF
         UhEwA6VF7AaOznQTBLB3Zg0xNudq2PS5nFLGplnwemA97emAj4dvtf9D2NCsmpugKZoa
         s7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712394; x=1744317194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ur2Tr6iw7X46fc/5bRLx6fdqJrE0cltK+bwwRImun+Q=;
        b=CVK5qUS0DE+gF9tVN1rfSMWNnjEKBnNhslFeOTp63SslkJxrjb4GU2MhvhqSENkUVL
         T25qMtmpOBhms1E39BtLWq5FPhwxOAhKs3JLerq8eZJa6ePuEZmhYHW1QlVRWfn7Np+0
         NEALhjGPNoVs4qDrdcHp0XkUWIrNjDRYklnTEC1jBfz2VM9oNuEEo9T+z3Wf1eBjs9fm
         xYfE/Zzloj4RD9A5NfeZtuqSGuvxyo54LLyEa1vfjs8BwXGhs/B+NOaattclfrJI4V+G
         xITu4G9Edu4dS8RfMded7CeJJvIH1Fa70WDru8cR2ooeQIgUH2YCWhVQJ4UpG7Js5iLn
         x5aw==
X-Forwarded-Encrypted: i=1; AJvYcCUPc9Pe5YGl4S8P8MEmpGGG1rLWXDOfXshlHx7mnU53Jf90pRYofE7t4TR+PRLKTYT+1RxcPmRjUwY5u8Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZMcHy79T/kjE8QhAcU2UfWqQZloYGTJL5cXDWNhACsPeVn0fp
	IGSRmMMvrzbp76ZE0dz/5XpO9UCrzd9Z2h581gPuic6RsSxfCmjTnPyuw9yFazCRlAr3B76d43f
	1QGy3Rj98dne7XJIZWRufve35lpQ=
X-Gm-Gg: ASbGnctNi4ysoP/+0rJ6yGHbMP5UhlZ5V4Kb9z4XP3ktiHEJiQnL20STONzrtrfEFZI
	KdNmxWLzjAgZOS+3P+0LVkAAKOf9w+L81xfmAcXu4OYNpOZV3hZZsqAWn9LhYO63Dk76YkHy3sC
	Nahfo+n8I72BdlU2c9dOsW/u/ME20rix8L4+2F4R+X+A==
X-Google-Smtp-Source: AGHT+IEu34HOnVSPLCEPZgUjMqgj5ikBMtgLqNQ7LH7V6Xsh1zQa1uWkmsD6Y8njY4+v2/UFK6c0Z5jpunIin/qN29o=
X-Received: by 2002:a05:6000:4284:b0:39b:ede7:8906 with SMTP id
 ffacd0b85a97d-39cb359572bmr610867f8f.19.1743712394400; Thu, 03 Apr 2025
 13:33:14 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313175312.1120183-1-luis.gerhorst@fau.de> <20250313175312.1120183-2-luis.gerhorst@fau.de>
 <CAADnVQKL-NwxigMWM+U=n5ZXPG+xHYzSTEv0Rq8Y91m45eRJDw@mail.gmail.com> <87cyedie3w.fsf@fau.de>
In-Reply-To: <87cyedie3w.fsf@fau.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 3 Apr 2025 13:33:01 -0700
X-Gm-Features: ATxdqUHPAFiAlWbRvEI6Dyb_uIy-F7VX7qdc8juRjqz8Jt6HEvin01eMZNJzsww
Message-ID: <CAADnVQKAFfOKWe+rdvaM=sKp229Kn14jj=K6+8oybw5m2Mh-RQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 11/11] bpf: Fall back to nospec for spec path verification
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Cupertino Miranda <cupertino.miranda@oracle.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, George Guo <guodongtai@kylinos.cn>, 
	WANG Xuerui <git@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>, Maximilian Ott <ott@cs.fau.de>, 
	Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19, 2025 at 2:06=E2=80=AFAM Luis Gerhorst <luis.gerhorst@fau.de=
> wrote:
>
> Thank you very much for having a look. Let me know whether the above
> resolves your concern.
>
> In any case, should I separate patches 1-3 into another series?

Sorry for the delay. lsfmm was followed by the busy merge window.

Please rebase and repost the patches with the detailed
explanation of how lfence works internally and it affects on
the algorithm.
I mistakenly thought that lfence is a load fence only.
That it forces all prior loads to complete, but not the other insns.
Since it's an absolute speculation barrier the algorithm appears sound.
My only remaining reservation is a heuristic in this patch.
If we don't do it, we wouldn't have to special case push_stack() too,
right?
Let's continue discussion in the new thread.

