Return-Path: <linuxppc-dev+bounces-13423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55861C12FCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 06:39:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwfMd0cscz3frB;
	Tue, 28 Oct 2025 16:39:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761629981;
	cv=none; b=dq0YWYXgaqtMeQvOQ3hBKg/zBjbJAn1WwD7Er+Wn4NkTA21/xc7U3ANuVMZWsyaPQk1N7M3Rhj2oEGvjCTuPdhlzGdAFwW898/PY+gaBkaG+VagfOfzNUm4e9fDYdznc2lIAv6T0VNSGInr8WzZLc68uf6vBaXF3c7UPde5DaE2wfJ2L77RzQI5I+sFlcRlH+U3jeK60/jS9KhqTUzrgR5bRtPwAfNYUdrs1K9crJgft2iRPE6HeZ+9psN8ou8VbeO5f+e+GYt8YBoFHskoZYHr+R9HCgGnDbdao9QpcVkIniy5kGeTEUAvh99MMqHxJ+1fsKnYXoDF3vwmesCdo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761629981; c=relaxed/relaxed;
	bh=kLpGC29sIJuMD8EW6D6+ekLf15xOznYOaep7iLxbnWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUhZUblAakck6DuNFEuUUNGddYqPastLhx/6tNe2yyFXFUxEhLs7N3a8nlVbIxdaTXsZFdJvIxKjdzclIZcqo39uSbo311tJjY9IOHFH0ooFb5rnORrmvsAqMvwceHuRejjVXuQRmW9M/l/LctWlBqUl8NYr/uxeuwWAaOuVSAl3li61qdDooxz6e4632Wbs0bcTWd73O0IDki0RLMQW3LrBpF6MOfeQ2NbkwuGBq4pPWzcXmmQ1FjhGjHizdAyBgjJrWqiuSzR6sdgZX3BFMDEl3WfKiXhUl+QmVQ3ynF3G+fluK4fr/BgKgM2Oa4hOQSUsTScncisfnb/6WmsAbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eOQQfELD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eOQQfELD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwfMb5sTDz3fr7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 16:39:39 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-591eb980286so5783783e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 22:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761629975; x=1762234775; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLpGC29sIJuMD8EW6D6+ekLf15xOznYOaep7iLxbnWw=;
        b=eOQQfELD2Kvb+HKNfQcx0Isv6CYdHp0UXQqGLeuoulHg7EJ6efCst6BVN/CuurXdXh
         FfOJW5tzKxA2B+LZ5raNLYpWeX9l1oBWB+u+gG4MFOwsB9B/LbpNySpl8N9HX5Lr2slF
         xrRMKSz7SXAuzYRbZBO11m8gFdk4hve6sqIIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629975; x=1762234775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLpGC29sIJuMD8EW6D6+ekLf15xOznYOaep7iLxbnWw=;
        b=eyzV94gEBd7RWj45yDMwcyJYLHdx7pK27L7ARKwejzMAejrU1CkYXc2xKGSAsc7tUJ
         l6aPOpGmqs7ZJLpi+458qMwSoLLr2bK5TaycLwgHCXP504ZrWctvqHjSLPeimwceYqi9
         zWxuX6i+SnUk5B2VyvmTy0Yjxt1uvfM86YloJBjhiLMlUNnCr/7QwkWsyxpdtQBnlbhU
         UZiZDb6gog4Bwq06QUajr8286ATE8ruhxd1yNZ1qwVMnf6qQMYJSCm1RCZfspMCCJroU
         lyM6azPjCjouRCPr2cSXtaN1NzJ2FvmSUE2MLUBIv+4795GmZ8hOg3QHI7JDpJ1eX7pm
         PW1w==
X-Forwarded-Encrypted: i=1; AJvYcCXsOg+nG6jA0o81TaBbgp9oEKexUyV0n48t4ytH7Cpo9wrmoZvt+XvxgvqsojIerPOJIk8mBpVSCsjczyM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJjuUcdrGAB9t2WmDoLV0IepcNg9hcZ0buGKkF5E/+tAy86sVy
	iFeVfTOmem/yo0bCcX6BZkLARmD7NIi2DD/MqvMK6wx5iyWGh9Q2vRlUX2lLKmDJYTvuCXRiZSQ
	4ovFuLpA3Kw==
X-Gm-Gg: ASbGnct21ASXWPFOBHd2B92h8a8n38VkHrqqu7MItoD4fNhxlaq8TPfdgnf4SY9vZYs
	yFYtMTb320GGmINOhDXFvr4EVSMHtUYMCtjO3fOAAF0rmp/nnfYq/alu6OtQpIruiV7qbKIwmn/
	RwSY8veUck/Gq4iQi4Ezy3F4NYfebPRh4p9qTFAVGdqwAlMSbV2TF0sXlKTO9aWtBSLiO8eEGGM
	FyfMNZQ0J6ksXNw0rwLNraLCiYenkrhsc/nhwnkpocVjnCMZeNbVmNI1Zr4T5vexnJ5KUorCvcO
	bVpmG4Yo9Hofe7bxhjGGYWKynz1ogMwbj+E2uq1gyq5QTKEY8N25V94Spci0dufJSP2CfaMPwVN
	HGunbHEP2/iaIdssdsq9L1kqKxrkGcsQXKiXmQT6SKNS3ViaoQD+exizECMnmwoFUKai4D0uJIm
	7jxF6SrZRTjdzGwdcPuUXCapIh/vrG64HxEF4DGn/r2olwCRImEtyovvPyzthp
X-Google-Smtp-Source: AGHT+IEzpd+Bdg64rT72ckoVTXVwJd4Baz5ppzbtT4KnhTA0mtA29n+amoELpqgFuTzgbpwmqb4Fqg==
X-Received: by 2002:a05:6512:ea6:b0:591:ce58:1def with SMTP id 2adb3069b0e04-5930e98f7demr745834e87.2.1761629974912;
        Mon, 27 Oct 2025 22:39:34 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41cddsm2757965e87.17.2025.10.27.22.39.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:39:33 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f9400b04so4802716e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 22:39:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU48Ypr55l7KOfjR8u04o425HjiCB8TGoV+Xwvm7M6wyjnttfpAxNTsvvmpRpWzcAbv1SFlIIvwUWrwzqU=@lists.ozlabs.org
X-Received: by 2002:a05:6402:2681:b0:63b:ef0e:dfa7 with SMTP id
 4fb4d7f45d1cf-63ed848cba3mr2102592a12.6.1761629641674; Mon, 27 Oct 2025
 22:34:01 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 22:33:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_FZnLha9Qr2sMQPXa1go4FPq2p5d7CnMoOnCimS2Wzg@mail.gmail.com>
X-Gm-Features: AWmQ_bkfyF7pn4e6fUY7bNVBhf2DrgjCvQYqt5ZlzergSjGB0BKOD2LLrniXl7E
Message-ID: <CAHk-=wg_FZnLha9Qr2sMQPXa1go4FPq2p5d7CnMoOnCimS2Wzg@mail.gmail.com>
Subject: Re: [PATCH v2 00/50] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 27 Oct 2025 at 17:48, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Things get simpler if we introduce a new dentry flag (DCACHE_PERSISTENT)
> marking those "leaked" dentries.  Having it set claims responsibility
> for +1 in refcount.
>
> The end result this series is aiming for: [...]

The series looks sane to me. Nothing made me really react negatively.
But that's just from reading the patches: I didn't apply them or -
shudder - test any of them.

            Linus

