Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F772D764
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 04:37:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Df/1T3ex;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgCPg23Kfz30XV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 12:37:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Df/1T3ex;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgCNk4Znxz2xgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 12:36:22 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-56d05daf0d5so27606957b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 19:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686623777; x=1689215777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YSVPfzMt+rk9sTY32IyGaGln2/vryIXACZP/WvUx8U=;
        b=Df/1T3ex/kvWIJlc+IL1FXIas1ut6LozSKIvHIOVrwCIDDxbgX9CID26/iXnrDU7vj
         /4VCJbTKxRlnuA+zvFZx/PS50+W+wpRVcAwsP66F9vUzlRHTeLBN5thnlTsVJgWTIeW7
         dC1sP2jJx5RCdyJpnktPiTNRocc3CrY33XsHtBsiFtd8rfwtOp4snUjWAjm9i1zDsNHD
         1ndEFKsB5dXP/gtfMgEDLaBMsVexuushn/KETrQevarX+GOsOBTrDHVzN0uTaOuuoLgQ
         4cTGymNgAgJiG2Z5THapaWL3KcWq2aw60Wo4puqzHsqH8daGcCMdtD8O1dt7s1AtDI9j
         IIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686623777; x=1689215777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YSVPfzMt+rk9sTY32IyGaGln2/vryIXACZP/WvUx8U=;
        b=hCovtCNeXENr4grJdq6DF3dNktfrP1DcIdBLLrOjfqt6xMvNTiI1j7gi5L6JvGZdz9
         L0uZwYrNrzvR1+du9Zd8GceyhFpSZhwuHOYs9aRTRVgVwT5HCUcjCVnsQnK2AWDZrk+U
         gnGmb9IARKqI1iqAkM1TdQPNJX34B7Fr1IEkBD59bb/3yqEQsGyJV7LNd+ORyOMKSunz
         RQt3pGIJRdm1s1w8Hq2I4Ysfd0FB1SCTXqTw4PhP41oATxt4/24JtviVKHqb3/bfzskj
         +WyfYqKkbgMQBKUbgz+9Fpmv7cAe/DwcPQkIiwsHDZltb/eeTSx+zZEyDvFWaWs88R7u
         U8jg==
X-Gm-Message-State: AC+VfDw4lB7LEIubzfPgsQSKiqNQ4qQVomsgwA/wjBFGNKuLuI0haa36
	QbzIy0O+UtTsL61TDWB6m/+s0OtOkHBCpdpe2BDBVsNTXeI=
X-Google-Smtp-Source: ACHHUZ47lIMltkC5wB7GDRQKh1vGReyrjjzen2014np0p5cCT3CknTuQn1Co/WmnF4yLfpPSwMZzJJgLivGAi7lZrPA=
X-Received: by 2002:a25:a1c5:0:b0:bb3:b6b5:8c6 with SMTP id
 a63-20020a25a1c5000000b00bb3b6b508c6mr357687ybi.29.1686623776937; Mon, 12 Jun
 2023 19:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230613014337.286222-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20230613014337.286222-1-ganeshgr@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 13 Jun 2023 12:36:05 +1000
Message-ID: <CAOSf1CGzmbbs16zCAV8_NN49Sd8ifi-4Dvo7wXdVNDE-j76qPQ@mail.gmail.com>
Subject: Re: [RFC 0/3] Asynchronous EEH recovery
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 11:44=E2=80=AFAM Ganesh Goudar <ganeshgr@linux.ibm.=
com> wrote:
>
> Hi,
>
> EEH recovery is currently serialized and these patches shorten
> the time taken for EEH recovery by making the recovery to run
> in parallel. The original author of these patches is Sam Bobroff,
> I have rebased and tested these patches.
>
> On powervm with 64 VFs from same PHB,  I see approximately 48%
> reduction in time taken in EEH recovery.
>
> On powernv with 9 network cards, Where 2 cards installed on one
> PHB and 1 card on each of the rest of the PHBs, Providing 20 PFs
> in total. I see approximately 33% reduction in time taken in EEH
> recovery.
>
> These patches were originally posted as separate RFCs by Sam, And
> I rebased and posted these patches almost a year back, I stopped
> pursuing these patches as I was not able test this on powernv, Due
> to the issues in drivers of cards I was testing this on, Which are
> now resolved. Since I am re-posting this after long time, Posting
> this as a fresh RFC, Please comment.

What changes have you made since the last time you posted this series?
If the patches are the same then the comments I posted last time still
apply.
