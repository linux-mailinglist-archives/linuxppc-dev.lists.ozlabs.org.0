Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FB897C09
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:27:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tTdEFZdZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V91BC6chRz3vXy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:27:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tTdEFZdZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V919S06bzz3cRq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:26:51 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4317aff5cfdso2334781cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186809; x=1712791609; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBcn9RQF0khXV9ZVvmQc6tCxymNH19L2614rNh3knFw=;
        b=tTdEFZdZbG6x23q6ZUmtoId3yJcneYrJHGB3N3z/lHL1ML5p9eg6y02qalRhWEIlSR
         ABBwVEJAoKAL/ywoI7qZ0hsyXkml0Ke5DKMf44KWfZsFtQ+moZIXt4Rh6nQ+6+m0R9l/
         fcdVSvMiI5RfnxQHlM5Zx03VM6hBWfIl3oTa7mN4EkowPNeB0TFti1fK1P+MKZCDH6lH
         GT1U4jdlQaLleRSvuqRacPzSnjV5Gx5lcfZCUBVtPKsnrzko47blgRhGbEQovzHhqKG2
         AgtoUJymPw4+B7R0yguSrU/wGCX1V/3sDMLkfrGZTLGd4/btANMqWt7eb0FLsyQRWDLf
         s3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186809; x=1712791609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBcn9RQF0khXV9ZVvmQc6tCxymNH19L2614rNh3knFw=;
        b=gr9WHjyjYKxEy5L5zoIOZVKB7O//PuPeCD7X88Bx6tiApyIfsk6auncaup6NXMYlm3
         FufEVAMce6Nr6L9+TyHYjmyl3xcB64KVoJRnwZo+QiCWt8jDzSb6kOsF85kaS8d3yXCy
         ckXt8JSHQB3yv0fqd9Ewa2PMJt0jR+123yNLQXr0rf3sI/ht0G95rEgqDrw74U4JolhN
         ciSsWBCLJn1hRUTj5G81xSkcEA99KLlYDKUp/5klaP1iFLS/wtZr0IPC58eOF9v8JV6Y
         +mmW66kB5FdjVzYfUruMPNBdRemL5GX6UvMqmKJ7HS6Whz4OR1srHllmPGuBvTEOi3dg
         rTtw==
X-Gm-Message-State: AOJu0YyujMlQr7hrUfY3C6i6DS7Tr0qWEa49hRWdhA978T3R/nY2C1Cn
	tsCeO6EGuqJ0rUl9BQzHbzZ6gqD+RhKum8U4SYXRb9Gr6vmKYH8JDBt7AzJGZuqc5y+gEf1DOME
	Av14rEwsDVaAfvc5VlgOizu/fEA57SVGwBqUYjjAqb1M3JOg9qNw=
X-Google-Smtp-Source: AGHT+IHsSnyuoqbKW/soc2+mRtnSGWMTbRhMNBsJqE1Slyi/NI5rBdix/XXtbL6+xdOG9m7FVsnvnJV9N4H6er3T94E=
X-Received: by 2002:a05:622a:ca:b0:432:b41a:17d4 with SMTP id
 p10-20020a05622a00ca00b00432b41a17d4mr691778qtw.47.1712186809558; Wed, 03 Apr
 2024 16:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-6-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-6-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:26:12 -0400
Message-ID: <CA+CK2bBTh_LSAtgx3hzmrrewtQ_rr=FUUmG85MBjAka5TvfdUg@mail.gmail.com>
Subject: Re: [PATCH v12 05/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd_clear()
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
> This reverts commit 1831414cd729 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pmd_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
