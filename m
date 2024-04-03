Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6D0897BF9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:22:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Cz2ZWGQu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V914h2G4Bz3vYy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:22:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Cz2ZWGQu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V913t53TNz3vXX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:22:02 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4317fbb669dso1742991cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186520; x=1712791320; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXcO43bUmmb2iWVE73B+B6TYtQMD5KIeEgVcMTv5NoM=;
        b=Cz2ZWGQu2vVfg2+OYFM3fDUZ5i6CJ8Zv8tRuCdmHkxrDDe9hWhzY783cSnxX0uflJ/
         5H+fDoRU5esP49dEk8LJRyTPhBWWQx94gukJxPZ49dfaBG/jH3dgzEEkET4rImAOzQz3
         JoE2NEZcCZBJ/FVd/x33PLIWXejCfZrrMOesLegRalx3COTaHcuaPW3KN5RNR01tB+ji
         7EPAfB2FBK8b2rqfI9LByFBv9z1gvpMffjr8lIE2Xl7iZfrCyC5i5mRnIzwFbFlXE8q9
         u3kPkgnmDxRQVhwxreBNJmPGR93wYkgwKXxTqgsTAixDVbbV5Mw7XEwz+iBr2WJumizT
         Nkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186520; x=1712791320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXcO43bUmmb2iWVE73B+B6TYtQMD5KIeEgVcMTv5NoM=;
        b=AhgG5zf3n5PcnKaQboNs1F/KAHXv/eZo76ceEZ+O4bL7D2nGyUzqOgBh2uv90vdFWD
         doEkZXsGlbyqM8tmKgENlPQylUiE8YBsoXJPPPFf+1i22DruF0mpxbEtQ5mvj2MUb9Cf
         I1dWh22cXHnwgyK2jDf/5m8fnPwLaq1N9CcjwiG0N8afil9/d+qpnivduYNPLLIvTewr
         TRgydQL1MtHsYqyIJc2JkB4X8M2CRDq8AWXOzWurEcOwySeLnLrxBwIqYyLQhw5rznqC
         JZE4/FWYEOvpNW3l6HGi0mJrR6tV+bEiBuvjvaId75CcFFbClR6P0Kl3bYJJttkXR/ef
         O9Mw==
X-Gm-Message-State: AOJu0YzsRLI91oOaoFSoVMxQ9SezXf64yeHQgqVdsvNOHFYN00Thj1gX
	0wI7R47Qe9jOdUEG+fvrcuYSOX2dTQ8uIVUGF6oUm2RMj4mdIAm4Kx6YAlgIWmMhxG+jxZosiPU
	RFKRdm527GdsVXm9iAa8zOWLVKWnNpSHZ6GEZyQ==
X-Google-Smtp-Source: AGHT+IHeuRiGxCrbAbOW/v+/2itK4ZpQ85NMYmGobH01UpzDgaJ8I2k2PGyFRf6dw0LUPjoEDgTHBQaY7AiiWo2l90U=
X-Received: by 2002:a05:622a:1653:b0:434:4e8d:4357 with SMTP id
 y19-20020a05622a165300b004344e8d4357mr407490qtj.21.1712186520623; Wed, 03 Apr
 2024 16:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-5-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-5-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:21:23 -0400
Message-ID: <CA+CK2bC0EmNCTScVt97xKBgWB9=BND6KFjJPGd8QXQ8hM66Y5w@mail.gmail.com>
Subject: Re: [PATCH v12 04/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
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

On Tue, Apr 2, 2024 at 1:13=E2=80=AFAM Rohan McLure <rmclure@linux.ibm.com>=
 wrote:
>
> This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_clear").
>
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
