Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D1855334
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:28:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=maPFus1q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZpCF5w0jz3dWn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 06:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=maPFus1q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZpBR42kGz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 06:27:58 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e0f4e3bc59so156143b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 11:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938876; x=1708543676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KnjRLwW6qeAAWQgWTvjpbNM3OaTV5ZKjGAIc59AkD9c=;
        b=Cw+d7IKPBRDJ29p1L8nqUkCkYT1egg0442qOQ2nIBIKMVmKLveqpQ+Xc2VfDJJcR7U
         nvZP3sMDGs6SEqwDcUqlBNyW9U2ATsbGMAO8Pt60PsLETbI6E5pueytukImHaxmhxvZI
         vsxCB/bvrS11Wha9A509SWS7fA90YwawmD0Yuy9fq2sos7z7oLJDh1vlO9xFSG5tUK2U
         cBM+P+UoCp3gL4Z0G5Dqua0MwPcr3faHVwxIx9n7ymAmT/imajgAoO5x+bL141EY5T6S
         cmt4Q0VS6rx9SD1c8uqvV4Fg2kCkARubSRbXj8N97vaihkofgyMwDY1H2ehTZrfh5N7D
         rNng==
X-Gm-Message-State: AOJu0YxgGUiopQRGyW1RCdhohOIc+tvuV/QXI5IJRHiTCrmtZQDrF2BO
	l9C9iXSY6KvBOw+srAZ6bjS1/8ZLNuB/uB84esrFiNWHGABCCVeU
X-Google-Smtp-Source: AGHT+IHegGu1Lc6JHujte9HWk+U849QrRHwoSPJSqWXl8c+HXhJmNQ+qoZKZb3gAFc+W2fsg/d5Lhw==
X-Received: by 2002:a05:6a20:93aa:b0:19a:fa19:23e7 with SMTP id x42-20020a056a2093aa00b0019afa1923e7mr4662887pzh.55.1707938875745;
        Wed, 14 Feb 2024 11:27:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa34KWh09rSYQyE9nF7fJS3F2IPd03THcCf9aU6FQa3IAiDx1LsWllRCgEoniJtv6tsGHfNIO0J5zRs4HHxiXtfuO9TRPplBhygbzpf3W1S417xhgXdaxak/bluiAQCC+BEUqkffVilz9bdq2CvrThtjeRQvhINJOjZOQVpnZ8ycw8ED62RTnUoUNr8R9Fx/74p4zsKsu+ZRRbF6LfSZFgEsj8SrOFgBOVuY1GkZ6eM1U43plxZeDsTM59OBmUJBVFwQ==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id ei52-20020a056a0080f400b006e0e4b9b7e6sm5566104pfb.212.2024.02.14.11.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:27:55 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707938873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KnjRLwW6qeAAWQgWTvjpbNM3OaTV5ZKjGAIc59AkD9c=;
	b=maPFus1qp9Xv5h9LhLO+NfqqYYnwQda7r95wUFaLGv+wjMlY//L1rO5mAM6+NuhKi900w+
	Lf5zn4iwdVvNADXICzlFQiYMjZttHE3P20l+6DMp6IPvf/VhZEh7A7NiTtGPASS2aAkMGe
	TrAERZ6ibNQcJkNcxOeT1N5ZNTVPay7LVnGz2rffqx04lf3yZ5I/8H1I8Ueq4EVbM4hqP1
	TToN3I7P0vSlPM7R9mdo/8bHDD/BljTvAywkAYlKB0zy8cGEHEQDreR9SXYfAH6Zp8roGy
	iYj+fS6ZmfupGcZmd1seEa+P4SjvDtvoL1WYG8GdzG3n3qYiGwK+OSDy0ongtA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/2] ALSA: struct bus_type cleanup
Date: Wed, 14 Feb 2024 16:28:27 -0300
Message-Id: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwUzWUC/x3MQQqAIBBA0avErBNUsqCrRITZWANi4VAE4t2Tl
 m/xfwbGRMgwNhkSPsR0xgrVNuAOG3cUtFWDlrqTWnVivXlxAW28L2EDW6E2abx3vZHDCjW7Enp
 6/+U0l/IBlrASWWIAAAA=
To: Johannes Berg <johannes@sipsolutions.net>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=X6od+QN5zi3KBcLvJ2WmLsxhFSgPUZijlXB3ig3ROOk=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlzRRgqD50Kjh/z7zUDRvFGQ5rgpOi5V2O2AYGX
 hIUhjfS3WCJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZc0UYAAKCRDJC4p8Y4ZY
 pmcbEACD0T5RsUDq6fWHxNRzwotB+m1utHfTeWp77RvfXLKoZZIAHgmzUfz9dS3PErdHFheGoL0
 xKFWgt7H4f0/0/Yo3BJjY8Tw76AwIM7o2bGowLqAeFhJWdY12hSKPUPwI2IWTA4lVuXhm9nlSxP
 VQ5d8P6ISLYq71oVht5jOQmryblOVTmJ+IUoV81ELF/lFFIaQHM8nUsMtlKhls5m3U0nqpdA9Qn
 B1yvd6yIInkH2xrlR8LXpIwUaCnkmycURdEiwVNTxEKu0vNcnk0RXGB6361bsP7WYiZkAIP6EsP
 iBDMvJA4w8B+m39Rtvr0N837wC51+FmezpSNFXcd45iyIes4y4UMt0Cn258Xqlwkk8fZJlGFfqI
 BpTtlvAV5H4SnFovK3tpFGB9kaUQtlmiWriE82PYlrgppFS608qDCc8VTFUefNpLl+63MlTf7bU
 eUtVvA1eSMoS1TjO1D78+AX+0rwTr1SyO8cWnf5NFWjmr2wfEUWIC96OGYMBwmPC2FkKTAf85+z
 Hl/TbRFhpy+tW4dImZ1e7nO9rSN3ytLFR8cgUuTgD79cMBmV/08exealAOZHHV3tGm982wreRXJ
 mlTdedLshYOHDS3IEnMt3cNEcgznRJkKX1fcUXs2MbvZT/tkAgD5Sz4Q4kd4FP4AAQvc6EEC56/
 oVLkY93fN75xWWg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Cc: alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]).

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22

To: Johannes Berg <johannes@sipsolutions.net>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc:  <linuxppc-dev@lists.ozlabs.org>
Cc:  <alsa-devel@alsa-project.org>
Cc:  <linux-sound@vger.kernel.org>
Cc:  <linux-kernel@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (2):
      ALSA: aoa: make soundbus_bus_type const
      ALSA: seq: make snd_seq_bus_type const

 sound/aoa/soundbus/core.c | 2 +-
 sound/core/seq_device.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: d7bf73809849463f76de42aad62c850305dd6c5d
change-id: 20240214-bus_cleanup-alsa-1d05ffc6507b

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

