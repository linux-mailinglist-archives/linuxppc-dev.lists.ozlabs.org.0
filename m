Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C290E263CB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:47:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7Fw0tZxzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tbw4TN+F; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Cg21PKzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:45:48 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id w186so3636454pgb.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vAFs8FFwXqMONU7mZ0mSAnhghsElkW4VBZD+NbKq/I=;
 b=Tbw4TN+Fyj/1ywtz46PBF5uSSfgtYHc17A7QOg+8UivkkUH3H5tbGF4gyBgt9ym9K6
 GnZ8ikXDvia/qXJiokRDFWmf4ZmLnqf1S3K972OwhNeeTLYtSsq0f+bRKZLunERMARtW
 VRp0hcqLLe72oMosD3jnwJOHgAs7r4IeB7XrofAN0G2dcnByZe8p0dZ3gt5ziPlnFIh9
 icFYIYQ3rtcoEB6tsUwLN8k/KCbWUIt/F4tdGu+uw0eoH9gAjAx9dJpumdouYkLs2Bgu
 gyGFst16OBhJn2y19GU5a4ZXub0quwqbbuR7u/OSycHj58PF3jZ9KvD77pu4pSdVPYMh
 RK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vAFs8FFwXqMONU7mZ0mSAnhghsElkW4VBZD+NbKq/I=;
 b=WCAoKS6UKqE0e6HCs6dTdnecJu0Ckuqfyg7MnCap3MayoVDtKT8v1oIlVv52MzXP/q
 McoDvZxZ8sp21Po0TZrw3nKL/xElueTRV6chBAHN0/gryTyqcmmYqiSv1IHhGasLRei1
 lgyl+hkMXabrdic8snt+J0qF8oUyUkUX2XYN52fTyhgAEBt5oNIw+qU+eAR28TEROtz9
 xIXaBPYHazDJgGVmCsO5HBHH/repfLm3zYEVquft0FqvCtmHm2F35J8AvdLK+DnE27qR
 X2ehIAH7u31hrKJfpws1KgtRo4mDyX+lYXTmXGQVlTlC2Ud5sZCaYV5ratCO+QBeuIdz
 fPKw==
X-Gm-Message-State: AOAM53052tuuat0HiZmhpy8T7uvQAaFZ5s8C5QeGKTAN3D/2ZO3jNPvt
 KsyQNcWfn80Y30tIJtpeu0Wy5/IdOqGzAw==
X-Google-Smtp-Source: ABdhPJxS9K1vmtyZm0oOOTHgb8vUrC3dB8O1qIPjNUDr1PGulSm7xu6RP4VjU8KGDAV2xVVfXXNHRA==
X-Received: by 2002:a63:4451:: with SMTP id t17mr3093800pgk.92.1599716745363; 
 Wed, 09 Sep 2020 22:45:45 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.43
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:44 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: EEH cleanups and reworks
Date: Thu, 10 Sep 2020 15:45:23 +1000
Message-Id: <20200910054532.2043724-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is really two series joined together since they end up conflicting
with each other lighty slightly and I figured this is easier for all
involved.

Patches 1-5 streamline how the generic and platform specfic parts of EEH
are initialised at boot so more of the setup process happens in linear code
rather in initcalls.

Patches 6-9 re-work how the per-device EEH probing works on pseries to
make it line up better with the process outlined in PAPR. It also
removes the pe->config_addr field which has always confused me since
it's not really clear what or why it's needed (spoiler: it's not).

Oliver



