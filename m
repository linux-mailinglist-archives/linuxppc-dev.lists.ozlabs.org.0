Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8BB7CC76A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 17:26:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OpGHFJUb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8yW04L7xz3vYf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 02:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OpGHFJUb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8yT93qXZz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 02:24:45 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7a2874d2820so72783139f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1697556282; x=1698161082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFftDA/PClYULtpgugCLARTSXADqSLXzM0MPRZe4YDw=;
        b=OpGHFJUbcs1B3HoJYEH+myeVLwXmr4j467GKpzuMPUqkWh0yrt2kO49oEF4qJxoL6S
         CVg7L1BWl6UtlO4T3IRmorpnUA8GAjAVMYvKGqyqfdd4Fxm1Yeiejzmt+U+xa18msTxw
         HFzvnfm1mUvRN7/GZjK+3VLo3wqy/L4Zbc3r7ZndtzRazxafDw46Ux9+6BIbhoyikzAq
         7lsqcuFgRA90f9dAm3ifjXCffth3c7JWpJ8nI7ZiCQcdcx0C8BSRZ3euoC0SFxMy9Jxd
         2FzpPiQ3kFRi1vdsMcMDV63AS6d2z5wyCa9H5w2u1aBwHUeSdeMC1SUq2P6UwuQ/QYlz
         Smlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697556282; x=1698161082;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFftDA/PClYULtpgugCLARTSXADqSLXzM0MPRZe4YDw=;
        b=D7hciHqZ7GFu3Aex8GlGpLFGYULYOTxDBCcgHLX/56kF2r9iDM6Q/uCi+ERhcbjeJE
         hzkBGuEPmHqGdlxJWsa9THo8oJy+wPgkYap/YuVJOdJ7BRE79S/ER63CWZFA610cq4Ic
         bs5OuP/u1tcM0Jhpfwvgj/Tyd553niVRNHRY6t6hvtkteIZVqZq8InC2qeKnaKZjxLNv
         bRRfGZ/VPHTY3h411J7dWA42eBtvQPX5hW7FfApw94Z4yKOOrFNxWD279JxW23kX7h4l
         QsK2qyNlsGUYg0yYsqfTfE0Xys2STgISHd4FazlTUuQ99Y7kX0amjAykfXWHPaf5Q3yJ
         KA6Q==
X-Gm-Message-State: AOJu0YxqewJf7uQIRGHTE9L43tDiaCgDmySblLVj+EsdMTLCfviqiL1h
	RY6fmsXJBvrXBkVqwUDlmx1jPg==
X-Google-Smtp-Source: AGHT+IGqBvcX191cb5ydEBlPiyHzQBCO3yoc5cODSSSY5HWvi4n3qf9AgqtcQgec9s2vfbGSW3Wn/A==
X-Received: by 2002:a05:6602:340f:b0:790:958e:a667 with SMTP id n15-20020a056602340f00b00790958ea667mr3377419ioz.2.1697556282564;
        Tue, 17 Oct 2023 08:24:42 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 10-20020a5d9c0a000000b0079199e52035sm481347ioe.52.2023.10.17.08.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:24:41 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, gjoyce@linux.vnet.ibm.com
In-Reply-To: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
References: <20231004201957.1451669-1-gjoyce@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 0/3] generic and PowerPC SED Opal keystore
Message-Id: <169755628159.2220568.17278716462071055905.b4-ty@kernel.dk>
Date: Tue, 17 Oct 2023 09:24:41 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-26615
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
Cc: nayna@linux.ibm.com, ndesaulniers@google.com, nathan@kernel.org, okozina@redhat.com, jarkko@kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 04 Oct 2023 15:19:54 -0500, gjoyce@linux.vnet.ibm.com wrote:
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. The reviews have
> covered all relevant areas including reviews by block and keyring
> developers as well as the SED Opal maintainer.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> [...]

Applied, thanks!

[1/3] block:sed-opal: SED Opal keystore
      commit: 96ff37ceb203426b1bcebbae42399686110b0130
[2/3] block: sed-opal: keystore access for SED Opal keys
      commit: 5dd339722f5f612f349b068e8da6d6710fd0e460
[3/3] powerpc/pseries: PLPKS SED Opal keystore support
      commit: ec8cf230ceccfcc2bd29990c2902be168a92dee4

Best regards,
-- 
Jens Axboe



