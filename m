Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2A35E583A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 03:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXymZ6wR2z3c9W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 11:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YHYEkxUp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YHYEkxUp;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4MXylw5Dr1z300V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 11:45:29 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id v1so7383230plo.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 18:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date;
        bh=of02u+W0a1fJbkhALT5lyxy6mI2eTOHNNOZNhldOWNM=;
        b=YHYEkxUpO2gJnHkRF6uoPmkKlDJxGxf+tkd8cPJIqSIOhyH2dpS2GTupXtfZw0Iccb
         NVMpIULXPrmG5XLuB9m2jBLIkFvNchMXoHurvj2eDQ2cwJIZ5wHvk4uKCOBhO3bTZG3B
         XG0pXuCgnyQ1ZdA/YKw2fX+h8lYCVhZTgMUek5At542rnzhDBarWb+aXPf728KrtCFdg
         QRw9m/Aa6m4Y4yn85jpqroXqmOGDpcjSnEeNwNnmnUfxNMIGy3LCtYbTWyQzHeKVTrXT
         +LEXuqtCcB+zOXZa0D/WIrh2KvNXFjAjPZlc7KibCEjZF92iGgPDcBNVX3Hw7CqDpS1u
         vOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=of02u+W0a1fJbkhALT5lyxy6mI2eTOHNNOZNhldOWNM=;
        b=E5QVkcnSZFXaUoE79/FUmnz1YEXUPpjovSCCEv+Lh5vA3O/acWkEKCcNSJOjoeiCaK
         lZZ4/bXo0+mcOwbblR7950GwUPu8PfMcL4g0e7JRfVjJX44MnI5f8tbnFxS05CbBtZxn
         9Wq+JH2hgepewRjAaW3qY/qmjf2TTo8FBAyaZuqbrWveqraW49xLbtDInBxhUIm3E2ot
         VVBP6zxkN69GO9Y/hJy6Dx5a6q6d5M8CHLrBeH+9nhYrlnT9zRoHJYn1kSdw3/SKOSRd
         mY6Z9ijGbeewvXe9nrnBh4Yw4J5OpPleEs8dhMaIkL0ugnCBlUMBxRbGNss3N8g03ZZ4
         1yVQ==
X-Gm-Message-State: ACrzQf38lCtbF0yFqaW6vvsX/90YZ2P0inU9HOm1yywB8AlDMSkQKmax
	tMATOWEuEKJvxovyx+Jik5TKfw==
X-Google-Smtp-Source: AMsMyM6GdV+9Eh1x8OstRGmCqVDq81KREd4Z39Fz7SQh36xV6m3BD5CE/QdnUagdaedMDftVS2pghw==
X-Received: by 2002:a17:90b:3b50:b0:202:9e4a:2fdf with SMTP id ot16-20020a17090b3b5000b002029e4a2fdfmr1100085pjb.240.1663811126524;
        Wed, 21 Sep 2022 18:45:26 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b0016c0b0fe1c6sm2701763plf.73.2022.09.21.18.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 18:45:26 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
References: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] block: move from strlcpy with unused retval to strscpy
Message-Id: <166381112502.39678.10835166660229447824.b4-ty@kernel.dk>
Date: Wed, 21 Sep 2022 19:45:25 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-355bd
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
Cc: Minchan Kim <minchan@kernel.org>, Geoff Levand <geoff@infradead.org>, Philipp Reisner <philipp.reisner@linbit.com>, Nicholas Piggin <npiggin@gmail.com>, linux-block@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Christoph Böhmwalder <christoph.boehmwalder@linbit.com>, Jim Paris <jim@jtan.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Aug 2022 22:59:57 +0200, Wolfram Sang wrote:
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
> 
> 

Applied, thanks!

[1/1] block: move from strlcpy with unused retval to strscpy
      commit: e55e1b4831563e5766f88fa821f5bfac0d6c298c

Best regards,
-- 
Jens Axboe


