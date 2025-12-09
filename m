Return-Path: <linuxppc-dev+bounces-14703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF0FCB113C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 22:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQrqV6PJRz2xKh;
	Wed, 10 Dec 2025 08:01:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765282853;
	cv=none; b=GMNj7nLExkn9XHh3Ex2ZjpAf9iD3WlzfQ8m5rLv2mYw4KV7VyUtVidl4phlg1NmBCEQhFnaniB7JIOrUyObz9m/DlnBdDymfg6CYBS64cyzeE4oWANxnK0HA7aR5EohavjiFpa/RReRx4/lRXYnSgxz1XROLVriosDdr7Q9Z7O9KU2dYSipEZxqb4bOGw1fSeXRjs/0M1sbsmwkGmbFiBcAujOCctrduhwZSSFyq7bSZnyKkObmUkPIo4fjIcwv+a6x57EZ+ne6pl46YD5icYnUA28EJUmvDqDmU27tL2bdYl/7jvxlqUoZNGb9dZUDMt+6jlWxi4qnrswGipgbvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765282853; c=relaxed/relaxed;
	bh=nEfD8Lyw/dRBKV5CViuSFHaeX06khrUdVpmd4j5/q54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=On5gc9QoqK3HVxV8+OxBJrXFfILYM2H09GK6CWwd1pRlNN7I8lXqVFpKDBUM5GCGSW2DqP77TeufqrG3fBDFhk5o+3We9tMjMLZu7ZVR5vAVWZaqXVU3ybzL8/qt4lhrmYuTNc2hQHGG3dfaWkAeRf+nwr3dLXnInik3yx8SERfimU2IzSYNjFqn898isBGvG7mg6Q+z5of0NSoAajd69ivs8kkERVIqglwfhXQAAos0OHZFpQ+Pjj1GuyYlAD3EYpbeP17NtE3uqo8GK3mgipTtkdny00/OQnrpSg1cYRRGfvOhnF/Xf1+9v1JmXmNMpNX0Q0b9n8ike42GRCiNzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 337 seconds by postgrey-1.37 at boromir; Tue, 09 Dec 2025 23:20:51 AEDT
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQdH75P9pz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 23:20:51 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.239])
	by APP-03 (Coremail) with SMTP id rQCowAA3WeDGEjhpSrAbAA--.8366S2;
	Tue, 09 Dec 2025 20:15:03 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: lihaoxiang@isrc.iscas.ac.cn,
	paulus@ozlabs.org,
	benh@kernel.crashing.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] macintosh: smu_sensors: Drop the reference in smu_cpu_power_create()
Date: Tue,  9 Dec 2025 20:15:01 +0800
Message-Id: <20251209121501.35012-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3WeDGEjhpSrAbAA--.8366S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFykKw4xuw17WF1kGrWfKrg_yoW3KwcEvw
	12qwn7Xr4UKw40vr1DtFn3Zryqka4Duw1kWF4Fg393uFy8Xw1UJayDJrZ3ZF1xXF40yFyD
	Gw15AryUuw129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUUUU=
X-Originating-IP: [36.112.3.239]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwsLE2k35veKUQAAsA
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In 'fail' error path, call wf_put_sensor() to drop the reference
obtained by wf_get_sensor().

Fixes: 75722d3992f5 ("[PATCH] ppc64: Thermal control for SMU based machines")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/macintosh/windfarm_smu_sensors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/macintosh/windfarm_smu_sensors.c b/drivers/macintosh/windfarm_smu_sensors.c
index 2bdb73b34d29..5441a55732f1 100644
--- a/drivers/macintosh/windfarm_smu_sensors.c
+++ b/drivers/macintosh/windfarm_smu_sensors.c
@@ -374,6 +374,8 @@ smu_cpu_power_create(struct wf_sensor *volts, struct wf_sensor *amps)
 		goto fail;
 	return pow;
  fail:
+	wf_put_sensor(amps);
+	wf_put_sensor(volts);
 	kfree(pow);
 	return NULL;
 }
-- 
2.25.1


