Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CC897BF4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:19:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=u5Wy7Ao6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V910c0qmDz3vXl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:19:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=u5Wy7Ao6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V90zn5hhqz30gK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:18:28 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-432b72c706cso3084251cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186306; x=1712791106; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKTcZ9dm5Vbl1wlfrrPsPH+rEE5K6AdxwiFfzfHWvJw=;
        b=u5Wy7Ao62R1yavYXDkywcVpCE79kGIXRA+Jk1vmeZ1WjWih9CB90aAI3D8R38IzNCZ
         JcdbG3t3ZmcnJfOy4g5wKoZWASPhjQqdW4U0I2X/YUnVp109Id4ir4MowqzwLi1bsf5C
         o6oEmpcXUsgzf9H3ZZWWQnUneZIo+pxnQ8bPpZKrZIK1ggSixIAL7TG5WsJA/5f7q414
         l16ZdU5CqR2B2sHTweoqryAyWzuIzr6dy7xkaMmlnPtXlyvOvfAuSwYUuGTIthbCgkXi
         iW1GFV7QBP+cCXAG8UWziqr0PSaPsd5TK0G02XoAH8kbRTLKecMlkcro69Ydq4tsNZfs
         4gWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186306; x=1712791106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKTcZ9dm5Vbl1wlfrrPsPH+rEE5K6AdxwiFfzfHWvJw=;
        b=LYvKGyCQ927eeDLAVoSf4ndOD+qy9JMmqxnfTjqHd5ixDUzwFwYvj89k5PbFkda8EX
         mcNI/BJn3qFh/T/NLI6DOc1a0chR6kVooz7uLncEZrDyAnCnvbGVqFPY9tq5QdoMnQiz
         QQsynFYpOJSX4WNmOeGsKiLUUoKcevTS0XrAjmiEQn2WeG45h2bWfVlbAe0XJ77wdvWH
         MD+vsPiMVV8w9zM7ZJ/n6qbbsDnmbuDUj22zRK2wlLp1iqSTHFPovO4ssD/fMU6IGpHS
         Y8HbbpiFKYRiPJXV10EfKc6nBy6I2eMprvIGzz1n3rQNeRKaauBoExGPR+2TFrTVGSqp
         HUPQ==
X-Gm-Message-State: AOJu0Yym0vzPukaUn87TmZRfHQKG0DStBvKa2V9ZJvN2DykBJ12HsRIJ
	WIYOx+1alGxSRM3m6eBrBub1PkEHpUfJhJUyOW1Q32XbjzyQLMzLwFj77xH4DeTrludM6Pxxjo2
	7WL8mKyxOQy1xv12kzz3+G7hzNVZDSQyYTVpbXA==
X-Google-Smtp-Source: AGHT+IG3b6bmTq7JNK9eyjUfDwtFrXblUrguSJgPn1Dj/YB+5OfHknpAtgLCxMMQ0DWYVE9uTRHrd/QnpFOZ9fviQwI=
X-Received: by 2002:a05:622a:491:b0:434:3e4e:ddf2 with SMTP id
 p17-20020a05622a049100b004343e4eddf2mr1809297qtx.26.1712186305839; Wed, 03
 Apr 2024 16:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-2-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-2-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:17:48 -0400
Message-ID: <CA+CK2bA397y9aMc-CQwmQk7uhStWWVrx10c94+kfDUbSp5C9Eg@mail.gmail.com>
Subject: Re: [PATCH v12 01/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_set()
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 2, 2024 at 1:11=E2=80=AFAM Rohan McLure <rmclure@linux.ibm.com>=
 wrote:
>
> This reverts commit 6d144436d954 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_set").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> riscv: Respect change to delete mm, addr parameters from __set_pte_at()
>
> This commit also changed calls to __set_pte_at() to use fewer parameters
> on riscv. Keep that change rather than reverting it, as the signature of
> __set_pte_at() is changed in a different commit.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

For some reason this one was not delivered to the linux-mm mailing list.

Pasha
