Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 244786B8BDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 08:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbQ3Q0VJXz3Wtr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 18:22:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kJZ480Ki;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kJZ480Ki;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbQ2W0djsz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 18:22:09 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id fd5so24181577edb.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678778522;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9krYtYgrFfB+EZxwYgYFLH4M2qRAdQv9i48TyNn/Zvw=;
        b=kJZ480KiLGQMVSncOnZGVRRx4P0N7HZDE5tLslc8GyW3aA7WqL3XWUTKlXJ+hJOarg
         lOwW+YKeXPziRZZOYmtFTnQACP8mW49W/o7JddTQ1kGS6bDHRI5lWnrFvUxEHW1f9Ed1
         +TwWFNcQQEo5VwIlH6DD4/S0b8GsYP45529MACcObqbIDjyc86kGBdSxpSCQ1GZHVOfY
         VvzSvDxfcXqL/FCyvISuyWRWI0/28jqkpSQyrP8N3161bhOSCH3RGhX1s2EsMv/+m5DN
         M3WMJtbpQyDtwE0VOU01sTF9xqIIPxFtkARdZ581774I2NtRORQMkG/dci42SXs5oDMG
         80QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678778522;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9krYtYgrFfB+EZxwYgYFLH4M2qRAdQv9i48TyNn/Zvw=;
        b=XbJTeg1zrCu4gKNCq3Eb17acu1SlVtmynqYMx6VaN1yNCVpWX3bi2GXW7Ue3y54PUe
         IFZb+ZRkTeTNLgP25w2AERfthPuiQm/aCrJpuj3jAhWgqxCj8TBPH7duKzNFrVLtouAF
         kPlz8L5AgzT3LNbRXwQqaOTD0lvZF7DaS13c5rMPEDAndtVfq4NS61h3xabq3oDqB/vQ
         h8K4z8s6RGq1uElnvuzBm1B3FEWPTAZDgAvu862Rryea22Uft9fokj/9icIu4Bu9znzQ
         lRhSJ3LHM1X2zUkkdrvi+3iEEtyRtpm3IoYL0oDAvV904edKrKSXQhTH2yfdiysSxkag
         RPEA==
X-Gm-Message-State: AO0yUKXrDQEvJED5uSLsUnrc3anbuDFyuC8DYAi2Ia9bHm3QwIZ4rZ7x
	KFNX5A3A3gddl3WB7lqUl0co5T3ggso/m0CntWA=
X-Google-Smtp-Source: AK7set8w7RHwJaqXqkb0zNbF2TQM1bbv1FN1z99erE9S9U8EuBbiRbq6QJAK5jLQk8p6wLGQEkDGieMxhqcQw/ObnTk=
X-Received: by 2002:a17:907:e91:b0:924:32b2:e3d1 with SMTP id
 ho17-20020a1709070e9100b0092432b2e3d1mr747785ejc.3.1678778521709; Tue, 14 Mar
 2023 00:22:01 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 14 Mar 2023 08:21:50 +0100
Message-ID: <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
Subject: Question about the dependency on the config SOC_FSL in CPM_QMC
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Mark Brown <broonie@kernel.org>, 
	Qiang Zhao <qiang.zhao@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Herve,

In your patch below, you added the config CPM_QMC which depends on the
non-existing config SOC_FSL:

https://lore.kernel.org/r/20230217145645.1768659-7-herve.codina@bootlin.com

Up to my knowledge, the config SOC_FSL never existed in the mainline
tree. Is this dependency really required or can the expression simply
be reduced to COMPILE_TEST and we drop the dependency to SOC_FSL?

Note: This patch has now shown up in linux-next with commit
3178d58e0b97. Currently, it would not be possible to compile test this
driver, as the dependency on SOC_FSL is never met.


Best regards,

Lukas
