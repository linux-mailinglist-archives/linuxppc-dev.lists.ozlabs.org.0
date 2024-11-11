Return-Path: <linuxppc-dev+bounces-3097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 819419C48DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 23:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnP2Z3ljHz2yRZ;
	Tue, 12 Nov 2024 09:13:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731363222;
	cv=none; b=mxkGUjL+OuCNwMfmKessMaaX75dM0jvXAG2s7vNBYYGegwXVVF+D+tHs3MVswq/79VmTxJmDXeaq49lcN4HEUvhZhx5Vx7dnddmMJ8ua1NvCmvqGs7rqttxK1m4FdS5WxXtWt+JjEC4/mGQN0S8xpoJhFtZOoYAMe3VfRka63WmlmyUid/ySlRPxFhh7KajhkkKZp7J7LlSAuUGFj7UJNri89NpTkzDv8+YTCqFmqEkhXt+9lPC2GJNgwJx0lqwY7lTxdAclb7D5sYGhchDX3HUCmnAxTqn3Fqsc+ewlzkDFTQHc6DTyrlc6y5vErVxHwM/rQtxLcIDFNtHzoGMggA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731363222; c=relaxed/relaxed;
	bh=bHtjFkTHlvManDcfzLfbBoxvm9qmvWUgveqxB18wmHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NkPPyPXLPWBEhJjOohw0ujNMVLgKmDhdajNcO3/mBmZ78/wcQMRU5lOHEn4wOrZKU5O9DEb45aXVCDPFkYfU/l3/f1HfziL63wHwlTL43lmC0EuPCQ6euhlzUheGm8eJZZ3VlTzJMCVD801sQsrIRyLa9eRyE5EuHL+tjTk55bVGeipia4cnQHlyLcs/hwJmJIoHoLpD6fIsD5O6K0U78Uriej1Gb2ixd5yYTfe5ON5QNnPKkLgW72MmQELeOHvF/cjl9Zg24hoLTXZty8Q9fOf8zga4eLltmZIlr/drenlIVHQ9Mm22LmcHCHPc+FoYy+S6BeHFsZg0/gpoJc43oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=collabora.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sre@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sre@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnP2Y3S8kz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 09:13:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62CB55C5D6B;
	Mon, 11 Nov 2024 22:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A268C4CED5;
	Mon, 11 Nov 2024 22:13:36 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 41B9D1060457; Mon, 11 Nov 2024 23:13:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-pm@vger.kernel.org, Ed Robbins <edd.robbins@googlemail.com>
Cc: sre@kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <IOFJLS.120OJ5KJG9R72@googlemail.com>
References: <IOFJLS.120OJ5KJG9R72@googlemail.com>
Subject: Re: [PATCH] pmu_battery: Set power supply type to BATTERY
Message-Id: <173136321424.772650.12097145596022478925.b4-ty@collabora.com>
Date: Mon, 11 Nov 2024 23:13:34 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 18 Oct 2024 07:07:30 +0100, Ed Robbins wrote:
> If the power supply type is not set it defaults to "Unknown" and upower
> does not recognise it. In turn battery monitor applications do not see a
> battery. Setting to POWER_SUPPLY_TYPE_BATTERY fixes this.
> 
> 

Applied, thanks!

[1/1] pmu_battery: Set power supply type to BATTERY
      commit: 3287673c1d26f94845ef958090c583c46054b70d

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


