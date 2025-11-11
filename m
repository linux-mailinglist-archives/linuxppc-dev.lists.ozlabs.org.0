Return-Path: <linuxppc-dev+bounces-14092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85261C4D5D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 12:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5PBr1cBFz2yvk;
	Tue, 11 Nov 2025 22:17:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762856578;
	cv=none; b=SbuA/MrnccKy3hCe1uOUZJwky0SN3sA70o0DOGhQYEUr+11cONc2e14pC0Zg6glHU8V/YlJ94NSKLtosTRsywIDibR2z8f80fogOfeEKCQoz8fpcRdtYiik2RJ06fCSrSS/yLCSVZo0kMiuSe9UEQ/MhOIsgSj9VWuDMMx5mv7ubcIN+XiCNm7Pz56GCYKuMfcRIydIRP29eiA35cBsJaxa4xEYIpmjx0XO2VUeLBbbdTfWu46ny0uk9zEnyX1lWiYLzs7ErJ+zJ3+Uv/IcHOuoAFkLGz/CF2lQPrcG7mA9gZOPqpM4qxt75zO/O2JiHoeztZF2iLNA8iHkqScQUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762856578; c=relaxed/relaxed;
	bh=Gr4TOuugTT1EseGcVB5iZB82tbqvLcivaLR74+txrKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTrmWcaeIpvR5jX4XE8XyjebgRzKJW2uBN21TIqnDJZhRYUfU43+H1PZibTRVEeEp2r47xPJ6K5Au2ZZgLFtFKphsm2KT8g7e43k+jdfKJ87BwcbFPlXtEsMF0Hxqpsgfe8n1853+ZYKm4+eUlM0M2m/egQIVIoYqdNyG4qSOKoP9syH6YMjrGztkQfYlqRKOyc3nTDdrd463E26Kx8pu0wFJjAlrt+nBpwiYU/YubPFoeRb5zR3b8H35yYaNB8BkMa0eqL9wF6cwyzUJzTFnOOHuYvd1gTMSxPtZQ63tzvwxYVwCMlk1BpUx9UUWZPpQEP8aeg9alaMYq3AB23CFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ScdEparA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=miklos@szeredi.hu; receiver=lists.ozlabs.org) smtp.mailfrom=szeredi.hu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ScdEparA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=szeredi.hu (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=miklos@szeredi.hu; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5Mzz5p3Qz304x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 21:22:53 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4edb7c8232aso28519841cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 02:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762856571; x=1763461371; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr4TOuugTT1EseGcVB5iZB82tbqvLcivaLR74+txrKo=;
        b=ScdEparAEYD6zIl0KdJvIH/Wk0u+Eg9XzAwhzapC4nk4vEQ41b5Q92BPT/K2c21jB3
         vhMTcvxxncUMFFYRgOJlyvyDP30J3SmSW9L/6btCCW9mthJmXI1LRBAa9qaNKMoTYL+O
         HzeORENSjS48wGrFsEOSHhf3AOTDdHOS+d0mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856571; x=1763461371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr4TOuugTT1EseGcVB5iZB82tbqvLcivaLR74+txrKo=;
        b=R0jf7TdacMVT3QIZkJUHw0m5XdVtBMCzdcX+Lq8rYjG8dn+K95mlJ6/tCXqeLmTGSB
         8ELuv/9AoyS979JKf7CTw+yjotiHkXAueYJdiR9Pa68bFDogcKTBLVGv5lfUu9QabHlP
         r5Rc9HkuTwE1zQzhD525AbJWGJrO9PGRfII65zmS5M8G23liD5eVMb4TBIH8qWuhVBk9
         a70c/pgLafmfAM/bFiijxDc+eflqjJHrsg9ECjLCGjY3JrAG18JB4XObr57WeXHS/vUL
         w6VjiQjK04aJ7lAbV9np9NNWRhMTAUJhRywDI3pNOJNzRhsPwdgU98KAazif2gc2IinV
         u9cA==
X-Forwarded-Encrypted: i=1; AJvYcCUBfS4DLDGrsVDM7a2LzUFT5HbIFtLVVF0iIGQmBncQTsXXfUKt8SZCig7DctvkLOxmSGxsuHT7gLrASyA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUbzX+ZrAzpjLGAmtWzwId2qYdyLErKG+B1ninPMJzo3p1mVx9
	33vT/UL/TeZqnu2AsIw+8s9v2TjnRz6WLe/gCgxj87PoMaWQVTVf28EAtO/2FVR6sx1hk1iQ/t3
	5ir2BVQUfW2kMZdVRRAWftryOdZ+fQ088qAY3tdMp3g==
X-Gm-Gg: ASbGnct7i+i4B4BMIvVhQiHZI+ZYFGc/eMpecRzE80Hvm56L6yX0m5V3VytNi0VySRA
	LIQo6ukOv5vBdS/6YPaRPsY3I+gAE4R8A9RWWNn1Ae/paSCcyGdqgu76z58sobXFIEKpv7HECtB
	xVh+cDuM3DmDuRYw45Opozy5cNP0u9cZT25UCB4y3EwQnadsuGVfdsu4DGKWuh1IuVobgke5BO5
	3UxGaf2kJ13gHKcSc5LISYTw7FOw6yOL28q7U6TlfjG20aS7MnY2mbYLgs=
X-Google-Smtp-Source: AGHT+IElRIVhqCvDTFpSgFEYkQvi9Gos4SnKPGf8Juir9zGtxxq03gYdBJSCGUUe4Ii0djCwuMFVWPO3CN8YKO0f0p8=
X-Received: by 2002:ac8:57d3:0:b0:4ec:f073:4239 with SMTP id
 d75a77b69052e-4eda4e7cbb2mr148255861cf.6.1762856570888; Tue, 11 Nov 2025
 02:22:50 -0800 (PST)
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
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk> <20251111065520.2847791-2-viro@zeniv.linux.org.uk>
In-Reply-To: <20251111065520.2847791-2-viro@zeniv.linux.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Nov 2025 11:22:38 +0100
X-Gm-Features: AWmQ_bn6E4e4WTTnqqQ9ptsMdEgyTHjWIJOU4-smQyjZiT3MKecFKgj620d_-Vc
Message-ID: <CAJfpeguqvHUDVzR7N=To8keErrF8Bn9kuojoFtM_58sLY_XXDw@mail.gmail.com>
Subject: Re: [PATCH v3 01/50] fuse_ctl_add_conn(): fix nlink breakage in case
 of early failure
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, neil@brown.name, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 11 Nov 2025 at 07:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> fuse_ctl_remove_conn() used to decrement the link count of root
> manually; that got subsumed by simple_recursive_removal(), but
> in case when subdirectory creation has failed the latter won't
> get called.
>
> Just move the modification of parent's link count into
> fuse_ctl_add_dentry() to keep the things simple.  Allows to
> get rid of the nlink argument as well...
>
> Fixes: fcaac5b42768 "fuse_ctl: use simple_recursive_removal()"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

