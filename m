Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BFE78483F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 19:11:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20221208.gappssmtp.com header.i=@kernel-dk.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=lc9+wps8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVbVL3fSfz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 03:11:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20221208.gappssmtp.com header.i=@kernel-dk.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=lc9+wps8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVbTM4zFlz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 03:10:44 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-760dff4b701so40864839f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1692724240; x=1693329040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcSl7eIOF7x7GbMvE67YmruU3FXlviD1D6eE8yEnwjw=;
        b=lc9+wps82YDm5s/Dm7c0JdZ7ZBrVXBgf9MbrtGr0lNiY9OhGOp6nE3SB1K3JqHbzjt
         Zz4xyX9zZ60kc7fT9LuM8TKxX/FEQQUcSKkrPh4XRWcVoPq+nH536zXr/tcijZ0nkcui
         XUeJp2QAPi08zIrVE2xGnwuQRdJvKMdp87vkavGMhkMahZh/wFecRkUbPLguG8jBt3sa
         Hs9umPLrkEANbOKFlZsm0NARh5o278n8CYXY7lI0icXaUlV63wMgs+o4UaCG98bMxpjl
         ptWfuiFw3YyK4O8PUtqBdFGRq6lsJU0iCs3fKFP/Rig/1x9FPDsS3Jo2HGU720GEVVjA
         LvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692724240; x=1693329040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcSl7eIOF7x7GbMvE67YmruU3FXlviD1D6eE8yEnwjw=;
        b=juUr0mG2tdm4+Fp84SA+Ad1we16e4YVtoxS/CjA181a/ys+2J2OjuNzbGyKvcIP8lj
         W0Q/+b3PCphPX8f4LNBnQVe/0HaYJbpaNB0C+l6GbqBAUUO5gfp/KYf1kBMR9BQRwdo4
         nGdxOMe7EpWKxTushg1dhGSFVKOg347x/bWPyqE9kZuoieLdwh/VJSX0xkyE5wKpMtev
         7U4lSQMSVXjDWWuRPs63pKo/eMfbJxUb3M49dmL0HEJFSnZDu/FABsMvCmfcavLW2ZZm
         hXh9vuiOrlfIMmRPBk8jt74vA2OObLXrU1fiix+kiRlhUtbI5XaJ2wLB1p8bctMZEcHA
         jhpg==
X-Gm-Message-State: AOJu0YzCdOGUu2BxPQPzVd1eE38RUcJUlz6fA02N2lXZAGHaWlcI2pKY
	NuSbFbuUMiMCPlT9GJFKtj7alQ==
X-Google-Smtp-Source: AGHT+IEHbxaNNBJVjkW+ouhZWazYh5LGgU5X43YP5LQHZaIFzDLkUfgAH7lPfM/IT3rJdo0KA0zacQ==
X-Received: by 2002:a6b:4e17:0:b0:790:958e:a667 with SMTP id c23-20020a6b4e17000000b00790958ea667mr11702982iob.2.1692724240238;
        Tue, 22 Aug 2023 10:10:40 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a13-20020a029f8d000000b0040908cbbc5asm3276898jam.68.2023.08.22.10.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 10:10:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, gjoyce@linux.vnet.ibm.com
In-Reply-To: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
References: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/3 RESEND] sed-opal: keyrings, discovery, revert,
 key store
Message-Id: <169272423884.46393.6970317689418988820.b4-ty@kernel.dk>
Date: Tue, 22 Aug 2023 11:10:38 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
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
Cc: nayna@linux.ibm.com, okozina@redhat.com, dkeefe@redhat.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 21 Jul 2023 16:15:31 -0500, gjoyce@linux.vnet.ibm.com wrote:
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. The reviews have
> covered all relevant areas including reviews by block and keyring
> developers as well as the SED Opal maintainer. The last
> patchset submission has not solicited any responses in the
> six weeks since it was last distributed. The changes are
> generally useful and ready for inclusion.
> 
> [...]

Applied, thanks!

[1/3] block: sed-opal: Implement IOC_OPAL_DISCOVERY
      commit: 9fb10726ecc5145550180aec4fd0adf0a7b1d634
[2/3] block: sed-opal: Implement IOC_OPAL_REVERT_LSP
      commit: 5c82efc1aee8eb0919aa67a0d2559de5a326bd7c
[3/3] block: sed-opal: keyring support for SED keys
      commit: 3bfeb61256643281ac4be5b8a57e9d9da3db4335

Best regards,
-- 
Jens Axboe



