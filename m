Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3456FBF7B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 08:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFpbL1qnGz3fMZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 16:46:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ewjXv22M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ewjXv22M;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFpZR2q9Gz3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 16:45:33 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64115eef620so40103950b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683614728; x=1686206728;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pege+pJh2vw8OGdFrcIAhZ8YSFNxjb6bpLmyX94Cy8E=;
        b=ewjXv22M8VcHeIAvhMxM/lIefk2y5yOQv+tY24nD4NU1fiL4F9x6ueQuueeIKpJfKc
         ZhSH3sd1pCOJZyZQX5nUEY3x79M7texaF68ietLTmzgyDJUuWkGuksD2AoKJT7XpNZ2Z
         2HY2cf+1v0fMNfM9QRsIUYDV1PriObs/HW6Gtp1LuywZx0eR/8WxnvPyHapByriEucF5
         P0K+zTlm9xTxuI6DweNbb5jc7mEHNwqk+NvvJC5EWjg+s2EDC7dEhEQB+PaHnNWYJ0Hq
         hVkcJli0YYkZUNtP5+Tzp2KzSgHE52973NHX70HdZD+LhBU/Kl+v+Rs95t1guIiAdrE3
         b5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683614728; x=1686206728;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pege+pJh2vw8OGdFrcIAhZ8YSFNxjb6bpLmyX94Cy8E=;
        b=GfAS1Aeo20PeJfspRyXY0AZg4g0aRg+whW7FhQ9AC3IobFiJ1Qd7WjyKeGDyoImLvr
         TUTxvw35o2RyhSA9n2I3jB1NXKyDYUdtlQrl6DeUofrSMoWo8X3FXHBUr8OX7RRbQK9j
         p6prKHziSzIPDMdhCFIcwdxgNJWz2LLilhYHCxZsb+uEUf7lXH8X5VUkrEYOHEzpiPM1
         63q6P0WE4LzUdGirLxMkLbSHZEKTOQzlXvJISmwNsZ7rtIhdfxktp3HMQd8IwPw04DDT
         ZIYFjUTlWiXatRwwqNRvQQrjMgZKkPDYmcShEgIEuV/q/VSPpYpz0jPDIKBspdAB7jlB
         gJ2g==
X-Gm-Message-State: AC+VfDw67OfEu3cNz02dnMrLzpJcdipwQedJVxwG2/PyZl5JbEOld3Qd
	6Xeo7KACgTqpy4+LgSF4mhg=
X-Google-Smtp-Source: ACHHUZ6IenmpqVd+nkkbndennZVNK8xy1ZO5ni8tRfp2ipxRRy5iGpHLR0MlVf09NB2nrPs3XmYvVA==
X-Received: by 2002:a05:6a20:3955:b0:f4:ec49:b83b with SMTP id r21-20020a056a20395500b000f4ec49b83bmr17135057pzg.15.1683614728528;
        Mon, 08 May 2023 23:45:28 -0700 (PDT)
Received: from localhost ([118.208.131.108])
        by smtp.gmail.com with ESMTPSA id e5-20020a635005000000b0050bc03741ffsm576412pgb.84.2023.05.08.23.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:45:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 16:45:22 +1000
Message-Id: <CSHJLY451TDZ.RF0HOE2T64GT@wheely>
Subject: Re: [PATCH 03/12] powerpc: qspinlock: Enforce qnode writes prior to
 publishing to queue
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-4-rmclure@linux.ibm.com>
 <CSHDN1VV09RD.2UWTR4MET4V2S@wheely>
 <46600B7B-1E59-4B82-82DF-27D3B0473EEF@linux.ibm.com>
In-Reply-To: <46600B7B-1E59-4B82-82DF-27D3B0473EEF@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue May 9, 2023 at 3:26 PM AEST, Rohan McLure wrote:
> > On 9 May 2023, at 12:04 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
> >=20
> > On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> >> Use a compiler barrier to enforce that all fields of a new struct qnod=
e
> >> be written to (especially the lock value) before publishing the qnode =
to
> >> the waitqueue.
> >=20
> > publish_tail_cpu is the release barrier for this and includes the memor=
y
> > clobber there. Can we annotate that instead?
>
> Got it, I see that one now.
>
> On another note though, it looks like the memory clobber doesn=E2=80=99t =
serve
> to squash KCSAN warnings here.

Aha, publish_tail_cpu() needs a kcsan_release().

Thanks,
Nick
