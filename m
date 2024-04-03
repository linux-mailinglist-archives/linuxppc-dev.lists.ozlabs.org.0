Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9434897BF5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:20:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VhOYABsN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V91233KPcz3cy9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:20:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VhOYABsN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V911H2k6Sz30gK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:19:47 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-430c03bfcf4so1959291cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186384; x=1712791184; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBincRL+yBjuZ8bs7hBLRbKTeES+FzXLwipS6By/VzQ=;
        b=VhOYABsNCM9K9hMAp/HQde6yvmah7WnZg6mNUTWxUOXPQuzNY2JiunS3sS7LuzOktp
         v2pGy9/IrH+IxadE6i21HiP1ILaOLoBqmR+q94VKSZCGAaml12qsojR/169pI5BAM6M1
         mEbsG65XPabJUf1xdKKx879QMA3O96XKTrCfrBLLYOGrMzyP16JmJU7KoLVDrI+cCZ78
         WC9yGDG5YaXAAFkiRwZMh8v1D+zOY8abDcKPh0fSE5029ga8tu3Ebh9tHPZmaSiXunHt
         u/QejFdn4A0Ko2hbwbOSXTY5LLnR5DlUP3BuFnLL7FSqThx4K2EvL8T+1aKgNW4vnh9l
         DdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186384; x=1712791184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBincRL+yBjuZ8bs7hBLRbKTeES+FzXLwipS6By/VzQ=;
        b=UJP54QGaCEZTO2BDOKmSCf3429TvxLpI/QuSgwDtDlg1FEllK312ksOxcM+crLIZbE
         6OvLcB8GpchmycUPJpeYLLyyyD3QUCQv39Be/U2l2pfpKA4Qti6D7JwBV4Aie1lJRexR
         pV0cBwJudrU13oxgW3rlZP8bqsjnR1iBTeruSXHoAzKYrqkNpdyR8q8Bk++O+TE3SAr9
         4hMdkFiAuipoRwt1SkGiGY8csDKqjiaB74CtCsWMXHuhyG4yJyQOHEg7ZBxDw0CHoxxc
         DnzBsz7luGBj7xZR9H+KZpqKr2JHxiGuCLeprmL9O3Ei7IA7JZwfMqDgqilDc1ITl5/f
         mCIQ==
X-Gm-Message-State: AOJu0YzcoBsYDxJYfE0mMn4hCnO59vnbDIe1uLLjZKWKYMmU+y36C/mp
	fw1+eYS/8VyDWTMwdsYiM0dLJMY35u9XGWzYTo6rqUK3GC2CWjGF3oQZl47CSPFpdB/ijlEGgbh
	Sk00AjgtyKLilycoyCyJvPxDx/SvbIhn6OHA49Q==
X-Google-Smtp-Source: AGHT+IFqbzPGn9Pu00z+HmxSASTM3Pea6ZXOR4iwFZSFit+QP6eYK+U42m4BcRtJeMVDlEj7FerLpz/8MBHhfOSw1+A=
X-Received: by 2002:ac8:578e:0:b0:431:82ce:ed95 with SMTP id
 v14-20020ac8578e000000b0043182ceed95mr843988qta.16.1712186384061; Wed, 03 Apr
 2024 16:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-3-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-3-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:19:07 -0400
Message-ID: <CA+CK2bCajFVUY4jKLF8W7ezeUw6sZS9FJ0LrF7X8m=cA7Bbo3Q@mail.gmail.com>
Subject: Re: [PATCH v12 02/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd_set()
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
> This reverts commit a3b837130b58 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pmd_set").
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
