Return-Path: <linuxppc-dev+bounces-14414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01DC79063
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 13:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCZMT5YR8z304h;
	Fri, 21 Nov 2025 23:31:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763722323;
	cv=none; b=l19vPV9nebS0XXhwa+ZE2sDKq2abHasjCV20fjsnkaZBJ/s2AOTqLUvMGSVABO+Cd8nh+fhmy0Fgs56K3TmBcJ1AZ1cE9PEUXHL4aujQUEypKD5H1oULmDZA7pJ9+nQkfcETgTjtNXFXrkXo/p6IEw2KGx7YP1V+Y2yoQbZSRb8pIoV/V3+/L6hpJgdBsrb5pi0/joYPrcjoOD+FeXQpgBqWiLwByAfLEmSNOMbL22LCVQV9+NK7p1c+m+6TzBmViuf0VgCxkoeZdQcF7sjfiQRc6irpEGZRXHCXAdj0qIK/m9osOmUbU/p08evFnVzVI30lytlJsnNoXXnGdJNefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763722323; c=relaxed/relaxed;
	bh=MIWX+3QBlGHxsLrVfyAW5KP8uJTudDyCKQOw/ZODn0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K2O8lglpbBCScdzNnZYIqZbjFgIMkG0wJ/pqWX5vNvVIEHm9Z36JeECMeOeYpfBIxj3SlXPLkaGo71nDy0vURCkdhs8a8ks6WFcO577aJtUb7vBTbDFtyQAv+rlWgRDOx0ms16zchNL5d9m1r6xlHJHx5Ne+GZpXczW0ntTKuCn5REloAXHRBfpFAACXR5+Z2y6GdkYjibuff3vx+RHaRYZel4PRq5/J648/TOvctjcjOg8CwPVB0K8cHmw17e3qMNChEvsvjQ94HAW1jQBbhUqIMMh8p7VMBHXaXY70U+tgXyoBP2SuIthap36ndNMAVAw0l1HDryOZv7rjH0JJBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DjsU3gbM; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ac; helo=out-172.mta0.migadu.com; envelope-from=fushuai.wang@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DjsU3gbM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ac; helo=out-172.mta0.migadu.com; envelope-from=fushuai.wang@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 136 seconds by postgrey-1.37 at boromir; Fri, 21 Nov 2025 21:52:00 AEDT
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCX8w4TB3z2y5T
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 21:52:00 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763722156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIWX+3QBlGHxsLrVfyAW5KP8uJTudDyCKQOw/ZODn0A=;
	b=DjsU3gbM2PjJ7fN8F0HABnztTK4mercatwaFEi0lRCcxvjaJSLeWMRNaFa63a/0GsTsNE/
	KAWmjXLw3Xj+6tX8KIOEHR6zN/Vay/u7D8EJfSlh9cAfnWEiZsXz4ZL2soQrV8iIS6v5Do
	NXPAQ9GM186cDk03x5sArmNzMJTuHGE=
From: Fushuai Wang <fushuai.wang@linux.dev>
To: 13875017792@163.com
Cc: christophe.leroy@csgroup.eu,
	frederic@kernel.org,
	ligongwei@kylinos.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	wangfushuai@baidu.com
Subject: Re: [PATCH 1/1] soc/qman: use kmalloc_array() instead of kmalloc()
Date: Fri, 21 Nov 2025 18:48:54 +0800
Message-Id: <20251121104854.75800-1-fushuai.wang@linux.dev>
In-Reply-To: <20251121061022.114609-1-13875017792@163.com>
References: <20251121061022.114609-1-13875017792@163.com>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SORTED_RECIPS,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Replace kmalloc() with kmalloc_array() to prevent potential
> overflow, as recommended in Documentation/process/deprecated.rst.
> 
> Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>

Reviewed-by: Fushuai Wang <wangfushuai@baidu.com>

---
Regards,
Wang.

