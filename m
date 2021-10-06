Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C6424353
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:48:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgQG53lVz3f0Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:48:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJb00v5z3002
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:58 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id w206so4863660oiw.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDUPVdWmFpBgvCkQTCBoljrAdHSMkkZBVQWsyUTyf5E=;
 b=T3sNDcRgi+trCRAJeewkOsY3b44AN1Wlc+p6DEES31dyVXrX8JQnFhMcXL5KLTv2n6
 0XFs+to4cuVYnnSER1t5df7loRafnVH2pEc9gC/Mr5QbrwDNiud5MaqIy2pDWNgKLEQR
 iY99R0M4Wb260LQi0X25q5/HZZUZJ9QSBPVeqs1DZpI9csdkDes9DxhCTI7v+RhX/cGZ
 J/QNBhIe9oTlUFajI/uQ/9G9OAKH7NShka0atA/zO0IxZYQHxff/Ghm81GWS1+9ELx41
 pZ+YXJR8k+dtSfw2zC5bOATour1USWkWa/4X0uUQ9nS3O5wiEjOl6x/rXBH7+L7Nzvrg
 fA4g==
X-Gm-Message-State: AOAM530+jtODr3JMqcAMdOdhUUwXNB3RwilVyQsS6k9ybxrqMrOA82YY
 l0d40CmvyQa2v1SmSgTTpw==
X-Google-Smtp-Source: ABdhPJzdKu+vPdU6QOPaibRhZZ8V3BXWev73rJIyB9NkWGThVarWr5zcXuesMdXl3XDSlz8SwXuIcg==
X-Received: by 2002:a54:4f8f:: with SMTP id g15mr7727342oiy.178.1633538636692; 
 Wed, 06 Oct 2021 09:43:56 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:56 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 11/12] cacheinfo: Allow for >32-bit cache 'id'
Date: Wed,  6 Oct 2021 11:43:31 -0500
Message-Id: <20211006164332.1981454-12-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Borislav Petkov <bp@alien8.de>,
 bcm-kernel-feedback-list@broadcom.com, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to set the cache 'id' based on the CPU h/w ids, allow for
64-bit bit 'id' value. The only case that needs this is arm64, so
unsigned long is sufficient.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/base/cacheinfo.c  | 8 +++++++-
 include/linux/cacheinfo.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index dad296229161..66d10bdb863b 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -366,13 +366,19 @@ static ssize_t file_name##_show(struct device *dev,		\
 	return sysfs_emit(buf, "%u\n", this_leaf->object);	\
 }
 
-show_one(id, id);
 show_one(level, level);
 show_one(coherency_line_size, coherency_line_size);
 show_one(number_of_sets, number_of_sets);
 show_one(physical_line_partition, physical_line_partition);
 show_one(ways_of_associativity, ways_of_associativity);
 
+static ssize_t id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct cacheinfo *this_leaf = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%lu\n", this_leaf->id);
+}
+
 static ssize_t size_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 2f909ed084c6..b2e7f3e40204 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -48,7 +48,7 @@ extern unsigned int coherency_max_size;
  * keeping, the remaining members form the core properties of the cache
  */
 struct cacheinfo {
-	unsigned int id;
+	unsigned long id;
 	enum cache_type type;
 	unsigned int level;
 	unsigned int coherency_line_size;
-- 
2.30.2

