Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE563897C7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:47:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cl79fD/d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V91dD4mdDz3d4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cl79fD/d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V91cT0JzCz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:46:47 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-43448ff9be3so2748651cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188005; x=1712792805; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAEOu6ZAgToX5xrdWbP5fG/SmvptjBh1dUJnI3/9gK8=;
        b=cl79fD/dF3I1MjeTTGcgDCeJMTtWCEToaEVPROXbajcLffHZHoghDTQorjRoahdY0j
         D1N3Z1yNe6QQw91l5pvJSmxhcjTMfjJkHip58A8c0ZHgsTcVrjsZeClT0O7a7PSGXavi
         IRxIGTTV5A28uNh7Pvxnqun5EJM20jMzDjBAg1W8/NG/5ZeuRyw2sn0YwKPvz74lbmLG
         XC3HGHt8DwcQrYvWgxoMKWEcVPc4TJGDpnruNnOfhWbkSuicGy47JKT8tibbuEVOLsWa
         CLSq5i9YQk8VfNBq3c3cOTpAgEv5AivGme3Avgray0S/lFF/mtpx5XFKdg+wJfxJaXPP
         NpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188005; x=1712792805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAEOu6ZAgToX5xrdWbP5fG/SmvptjBh1dUJnI3/9gK8=;
        b=pkGm4jNTRhEWEnjsugIe859gEUVjPEI6EQbdyY+B/NVc3VFIDbCrx234vGWQbGeZJK
         Rz8n5ji5+yOr0+dpFXfWdse3jYn3vMAvpmT/xt6PhzpxSamf0zrT5I2Ikc3blOW9AMAn
         RgVJgGpjGT47VEO7GNZ1ZuflOxBvzV4zSlA9PgqtYPG51etW1L0pk+iqT4B5qYuryXMP
         5kr1knv5G6RrwFfygCazsJdo2RQnvqBIrppUXsOgnv+N/wDm7uYVJdc2s1dYvRTqyZAc
         yVRxR9/uoJELUtI+06OMPDIyvGhvOlWaHJhNUkRXYVo902srmKTmfzJzOYP6wFIBxbQD
         PAwA==
X-Gm-Message-State: AOJu0Yw/yxevX4hNRKKO9dfpT6dd6UHdJkhbfYN+aL8lRd6tSETVbH9L
	17an97YdEu07+loAdLd4D4cT3QAVvVOutXO8rcyCChtpdedFOJyTPmHkIi6K+V4E/ozZmMPkrbC
	eFy+ZDQ8hJKcZWXJFLhHL6kRp8WZANRjYtWfccw==
X-Google-Smtp-Source: AGHT+IE86C4cI6mhSlVjNrd7GYRP9iJnVqBNonZegmUQItEJKzhRVRBavtnMQfl/Dr8sTGYjRV3i2VRx333RRXokfYY=
X-Received: by 2002:ac8:5849:0:b0:431:6cc3:8bb6 with SMTP id
 h9-20020ac85849000000b004316cc38bb6mr854843qth.57.1712188004913; Wed, 03 Apr
 2024 16:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-7-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-7-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:46:07 -0400
Message-ID: <CA+CK2bBomXx-yfJCLsFLwduOu_Payg0y-t8D+nJYX4XEJ4bF0A@mail.gmail.com>
Subject: Re: [PATCH v12 06/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pte_clear()
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
> This reverts commit aa232204c468 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pte_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
