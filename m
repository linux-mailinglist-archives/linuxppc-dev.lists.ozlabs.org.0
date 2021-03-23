Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1270346A73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:51:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4k7439fFz3brm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 07:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LHIHh9wK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LHIHh9wK; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4k6h6NKzz30CT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 07:51:07 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 30so11205986qva.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8RC8nmS4MblnkiHw15qxP1y9OHVQ/7r2SNW2Q4lYtno=;
 b=LHIHh9wKWHOJxG90UPYwpe5MQrd2BGMITz5Ce25X9H6mn2PvLAi37n1MMW8yRCQ7co
 2va8FxsBh1sH3278u4TkCzRVe8mP9Je+QEDb3JBHdkv5KRt/rMneJlXmVT+mDriM/Jp7
 zKlDfEhhFO+tQ0nHBWBVyx5kptQu/XkOCQLwxBi9Cmvqz7VNATJU2kTmL/F7uSvYu4PV
 gk06v6oWKQWHErFkIEMbCuHqAX6xnmd/cSC4rJYhtaVqRR1OJTjv36JSb5KQ7uMcfoEx
 0ubkUDd0mwM3Xtt+fbiiXHvW227Q8l8WiI9HFcnleFJ/PtJLob1iyOuWOt5Z7s8pXbxs
 OqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8RC8nmS4MblnkiHw15qxP1y9OHVQ/7r2SNW2Q4lYtno=;
 b=QnQY6A/cXtra/KEZAGeX+oFHIJQgkWfmb1vJ3bCH2qMhhwxU5UVDBPu7I2+U8J3Tvi
 jUR4X/o7ynPGOaLfItf2Jx6Umy2d1Gv97PdXI5CM7ghyVHdOf5sy22mVq+b4X2rdODuu
 ucsJ+rI0gJiXsmcIylhS85Q9Go4XcqAUZRdmWoyl2FEaVLBYCLE2S3H0mndNLpOn4/zD
 x1s+pHiBa3hcKC0VFhoJ1PHa/MBnWO5ibxZ4iqvMojDRWz9bPug5tjrRfySRSlUQD2XL
 rk/NXDRPz1iVcMoIvYK06KVqLLxpTAeNJjzFvPXu7hfHkip14ZkjAdF4ZFjNJUjDzfH8
 Nr2g==
X-Gm-Message-State: AOAM530r2YSXzNqoCwJVReXT1GniwsslHYPtnkrSzoKS/Xo+FcepZnsu
 ynraUVmlf+PQ6xhlUcxeUJH3mwQkriY=
X-Google-Smtp-Source: ABdhPJzFqMoBFkAXoA8dCn7waB53HFZnxGdmO6vMlYGqy3aYggaZZ9izfKQeKi9QkkjrFkLh/E6/oQ==
X-Received: by 2002:a05:6214:425:: with SMTP id
 a5mr7124620qvy.55.1616532665656; 
 Tue, 23 Mar 2021 13:51:05 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id i93sm55418qtd.48.2021.03.23.13.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:51:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/1] show 'last online CPU' error in dlpar_cpu_offline()
Date: Tue, 23 Mar 2021 17:50:55 -0300
Message-Id: <20210323205056.52768-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

changes in v2 after Michael Ellerman review:
- moved the verification code from dlpar_cpu_remove() to
  dlpar_cpu_offline(), while holding cpu_add_remove_lock
- reworded the commit message and code comment
v1 link: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210305173845.451158-1-danielhb413@gmail.com/

Daniel Henrique Barboza (1):
  hotplug-cpu.c: show 'last online CPU' error in dlpar_cpu_offline()

 arch/powerpc/platforms/pseries/hotplug-cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.30.2

