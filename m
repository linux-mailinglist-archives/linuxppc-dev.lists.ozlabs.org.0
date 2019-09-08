Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C2ACB96
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 10:34:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46R4NG3yRzzDqYj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 18:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xy0s84Ep"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46R4LZ1xCNzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2019 18:33:07 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id h7so9561579wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Sep 2019 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Dvenms9Y7ILBHUAT3jSNMNmZR/R8ixW/QNiX0T3fndY=;
 b=Xy0s84Epf/0r5ThM7KFlOlfZVD9d9Ci5oqr03zZd2VEm3Wi/ir6LN98a2DQWDX1j8/
 TLY4i4EW/VS7X/9Qk5MR6xTXW5Xwp/Yk42/OKbtWmzAEnbbMOHgwhnEIGXoRWJiJPvaW
 keLOxQ3LcKHLh8Sjw+k/LOLV7qVHUjsciT7T5sqN5+1E9yLr7Xp1Ls3SUahRLTXCGKuZ
 TN8O6j+iE5YBIikJvz8S5jBB8UsSE/lzygxaC5IiN6jne2TV4m+DkcsFdCYtcdGfD7RL
 Z+RWoW0KaAYISaO9iSHM71cX9bH2mGEa/l9VSmK19bTHtSWd9XX/VSVDjo+1zerG/v50
 cMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Dvenms9Y7ILBHUAT3jSNMNmZR/R8ixW/QNiX0T3fndY=;
 b=KGfQQBQyG1B69mkAmWZxkKB0I2TSxKRZU1LRj16WDgxybmQnNS7BE3sL30DUzIfl7y
 nXx8qKVcFFRKd3JE4ljbRYqMSFZXda6Ar/yxvUb1TJjFYKpwH+9KgPlBhpE1yhbf4f2Y
 H0a+RPYk1STBNHxkJQJ0+6qjbR1npLATG8Oee5qEDV9IzZZatCzJPnFQaIVgB2NRahmO
 aqG1KX0JYdf4Lstn3vf/BP9jQ+FFfx7C8iavB6BjNZ/R0d8tI0D5Ne0TSa2xb47FAtcT
 YKsK9BfwC9k8AREsXc5OJ2b+hKCYSIOP1Oq1c3js6dzoE0XuhIzndu8CoUlSme4s3vF1
 Lsig==
X-Gm-Message-State: APjAAAVm2IatmRucvIU8gYoCdITTHDqeqgW+goolmPjIxAR/twk9phtA
 uNvE+xVJNlbTOi4kdzdoEDM=
X-Google-Smtp-Source: APXvYqxmEXYD4KfHG33ISQrdtsla0hWkLH3IEJfmTrLErV0Ihc/bV5nsvOMFY9z0b/uum8iYI9GRGw==
X-Received: by 2002:a5d:49c2:: with SMTP id t2mr13914364wrs.351.1567931581038; 
 Sun, 08 Sep 2019 01:33:01 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id u68sm17085458wmu.12.2019.09.08.01.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2019 01:33:00 -0700 (PDT)
Date: Sun, 8 Sep 2019 10:32:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v2] powerpc/lockdep: fix a false positive warning
Message-ID: <20190908083257.GA126088@gmail.com>
References: <20190906231754.830-1-cai@lca.pw>
 <20190907070505.GA88784@gmail.com>
 <420D09F4-FC19-421C-AE46-4B2A9157FAE3@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <420D09F4-FC19-421C-AE46-4B2A9157FAE3@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, bvanassche@acm.org, arnd@arndb.de,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Qian Cai <cai@lca.pw> wrote:

> I thought about making it a bool in the first place, but since all 
> other similar helpers (arch_is_kernel_initmem_freed(), 
> arch_is_kernel_text(), arch_is_kernel_data() etc) could be bool too but 
> are not, I kept arch_is_bss_hole() just to be “int” for consistent.
> 
> Although then there is is_kernel_rodata() which is bool. I suppose I’ll 
> change arch_is_bss_hole() to bool, and then could have a follow-up 
> patch to covert all similar helpers to return boo instead.

Sounds good to me.

Thanks,

	Ingo
