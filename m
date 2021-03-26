Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831E34A980
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 15:20:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6PK125SVz3c8s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 01:20:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DVgDVCiC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DVgDVCiC; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6PJ815gCz3bck
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 01:20:06 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id a11so4335329qto.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VNYA/5d4OFYRBU63odObVllZxr5LGFyplqMTqerDiWY=;
 b=DVgDVCiCfhUx7j51wjlWOY7FjHOX6IA6DSMedlXcD7GZqSX3xYg7p6JSvpidaaBv9F
 IO7IIV6lazFwXwzwOZIqIH7C56wdWjyMg7kDpaZDoy+hvEwbM0aTJRWEyubh5u5u0nFL
 YEEIg6fvnkggi6fHd/oBZGCiuFg/hsIzHw/2A+7aME/FOcmighL0oHZXTUdBkBkjcP3w
 2tIA4TfgkwgzYwloIO59vKvrPJZK1WRMox7e3wn7v42w9m303/3XuaAENaXfPJlPzWFb
 GL+h8mTtCV8zR2zHrbX4AIrPL1MCAnJ1Of+jxJ+gtxMMCCh5ndO8RXbZxgVFfpxt9Rf5
 ObBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNYA/5d4OFYRBU63odObVllZxr5LGFyplqMTqerDiWY=;
 b=ZoDWzIWwyzidtX9/aNKnrPaBVy1yUzuR0ueE9RoiSGEku73IC6VVG1ewP8swuOKmbX
 VGxcqc5JRbsoPxqkjUOgl1HwkB1nrtpz6uSlU27MCek0A1I2axBFkF+ljpJlkcdUvdjT
 EGpOU5YeFTpj7Q0fFjUbjDa1WItKQG6rFrk9Bt94uIIf/sn9ejVYAErrbUIPJpF/n5Yf
 AHyBoqYDEz6npT69NuYIaWNXbtuDwqKmhoH7NPwQA/2JBIlWNqukYBRRBaEMYapYzaFT
 GfmhM8FTELPhd8ubZBwLlk2jCWG5DtobCzWts50zurUAbU4KFB390PEnz2jKsWbt9k7p
 4efg==
X-Gm-Message-State: AOAM530wz6IVUYRGakCLnJihKIwZ6lqG8FnKJazO44sAScMI0MUdBiPh
 +1B/6iPJPIlxEzSjA6LmpXzuBkB3UaA=
X-Google-Smtp-Source: ABdhPJwE6EYITR2kszxAttV9k2KZ6GUKHGpCO6JAdM088cC/W6HmSDh5m5rTHVsIN3anhd6lyfBlIg==
X-Received: by 2002:ac8:5cc5:: with SMTP id s5mr12378497qta.15.1616768404715; 
 Fri, 26 Mar 2021 07:20:04 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id a10sm6689930qkh.122.2021.03.26.07.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:20:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_offline()
Date: Fri, 26 Mar 2021 11:19:54 -0300
Message-Id: <20210326141954.236323-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326141954.236323-1-danielhb413@gmail.com>
References: <20210326141954.236323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

One of the reasons that dlpar_cpu_offline can fail is when attempting to
offline the last online CPU of the kernel. This can be observed in a
pseries QEMU guest that has hotplugged CPUs. If the user offlines all
other CPUs of the guest, and a hotplugged CPU is now the last online
CPU, trying to reclaim it will fail. See [1] for an example.

The current error message in this situation returns rc with -EBUSY and a
generic explanation, e.g.:

pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9, rc: -16

EBUSY can be caused by other conditions, such as cpu_hotplug_disable
being true. Throwing a more specific error message for this case,
instead of just "Failed to offline CPU", makes it clearer that the error
is in fact a known error situation instead of other generic/unknown
cause.

This patch adds a 'last online' check in dlpar_cpu_offline() to catch
the 'last online CPU' offline error, returning a more informative error
message:

pseries-hotplug-cpu: Unable to remove last online CPU PowerPC,POWER9

[1] https://bugzilla.redhat.com/1911414

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 12cbffd3c2e3..4b9df4d645b4 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -271,6 +271,19 @@ static int dlpar_offline_cpu(struct device_node *dn)
 			if (!cpu_online(cpu))
 				break;
 
+			/* device_offline() will return -EBUSY (via cpu_down())
+			 * if there is only one CPU left. Check it here to fail
+			 * earlier and with a more informative error message,
+			 * while also retaining the cpu_add_remove_lock to be sure
+			 * that no CPUs are being online/offlined during this
+			 * check.
+			 */
+			if (num_online_cpus() == 1) {
+				pr_warn("Unable to remove last online CPU %pOFn\n", dn);
+				rc = -EBUSY;
+				goto out_unlock;
+			}
+
 			cpu_maps_update_done();
 			rc = device_offline(get_cpu_device(cpu));
 			if (rc)
@@ -283,6 +296,7 @@ static int dlpar_offline_cpu(struct device_node *dn)
 				thread);
 		}
 	}
+out_unlock:
 	cpu_maps_update_done();
 
 out:
-- 
2.30.2

