Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47987897BF8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:22:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=s+MsN/IK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V913p0QqMz3vYj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:21:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=s+MsN/IK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V91305Qcwz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:21:16 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-430dcd64e58so2398761cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186473; x=1712791273; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvwDj36J61ZlTSHcZL9odrv5keRm6neVOdEzwiuBeJw=;
        b=s+MsN/IKLm9UzCz0ULCzudFS3YZtcHtik8d8W0Nyi+OvecYFTFCH1eVlT1S3jNh3lX
         m+c+jE+WiPYzNvyBPQYKrUdfcXq++huEGkJPvC/DIulLXwdFJZaCofYlkboILa7VsdYm
         6GRdpDhlr7EjtnN4rnIreEgWee/wGATcVlZJAAcq58ri5UgihfkGtxsd/uymzhLGE2pw
         5uU4CPy/43iMzJonOMDtlLKV2yDx7o0xRobsZkmH5zJH3m/NciUusKitwhnfDjVCsEVt
         skfTa2+OM+PGTxnsM4yLvYJnZapcVVsUWMrz8vbuaK0uTHGSjTw8SNoHoA4Pq67bDo4q
         aQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186473; x=1712791273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvwDj36J61ZlTSHcZL9odrv5keRm6neVOdEzwiuBeJw=;
        b=eQCCe0TnKPNE8X98zNwvR8am0ETVmPiP+VlFwkTsHKY/+zBvjD2iKUm4toi43t9eam
         +xUwps25lwW2Zp7/nK+M/tUQMhVlVNefHvNfrSGEe0EuVtE8c0VokBoowql+4MyU1Aob
         1u1DO4zwSV17sA4NRqJVwwEUqR/dK/HmQPfC2oCi18vTWbfbrxpkv0DxI9ISkXCyWvb/
         C4zsGWX5OecAIR7oRZja1kTLtC/WZ7xX++mvg9mwJTOXcfC/ya7qlVFv6hx9FeQPBY0q
         8Kir+UAgB/2RGNIB/xYpEPRsz3TZ/D1mFtB8/w/Eb3QidZQGiUhUitft9T4bwk9hcP/Q
         3CYQ==
X-Gm-Message-State: AOJu0YyGsbWv9p/0fJIIlJmiUfOvYmiTaiheluPRJkzRI4JVXRJUSal9
	ZTgzqW9q4xTLGKcGmmxRma6VHU5+qHK3sIhZDE0BwCMFE2JLvf9pileNsS9tWks1Z7YqMucyjFY
	BWk0g9I1qiuRBp/JV4avvsX0aHe/3LV+pV9IWgQ==
X-Google-Smtp-Source: AGHT+IHTWS3wV6Oi3dcV6kh4MygToZ+Ok2H5HYECZyyamnaf+sN8wFntwNrkWZYUc/5FBBdotl6Oi8jVDoUNbIH3k8w=
X-Received: by 2002:a05:622a:148b:b0:434:494b:c69a with SMTP id
 t11-20020a05622a148b00b00434494bc69amr757146qtx.61.1712186472901; Wed, 03 Apr
 2024 16:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-4-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-4-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:20:35 -0400
Message-ID: <CA+CK2bAKVEGrXPURWyyssmq_qx0aj-MCPVUDAkY58w-BO71aMg@mail.gmail.com>
Subject: Re: [PATCH v12 03/11] mm/page_table_check: Provide addr parameter to page_table_check_pte_set()
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
> To provide support for powerpc platforms, provide an addr parameter to
> the page_table_check_pte_set() routine. This parameter is needed on some
> powerpc platforms which do not encode whether a mapping is for user or
> kernel in the pte. On such platforms, this can be inferred form the
> addr parameter.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
