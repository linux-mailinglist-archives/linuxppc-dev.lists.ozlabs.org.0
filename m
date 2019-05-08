Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8D18119
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 22:33:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zp8j0FR4zDqBb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 06:33:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tV5HH5lW"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zp0n2Rm3zDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 06:26:48 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id i21so10637889pgi.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=OoSAyLqOzoTY4imTMlt5PXtdUH44ZwugWLFtgR1oxSE=;
 b=tV5HH5lWOzHtckicgsfc51J6eNwMvV2tW+XHuF6CYyJUdxBtE1UJVmLFLeV5joiFWN
 uxjlFtB+LxasFatjjPafAohY9evgEv+8ADu5Uyi9FHAhNPbVJmvq0wYRqdBv/7rusYGU
 0zEUlRzHjo74veCDdg+/RHOBm/cyJ0UQDX3qU/HBqDt50im2NsaSv7bpZouSpC9JoC3B
 acSRkq46X8/LmyKUnDuRtknHutDaPJFhnCs8ENjgWsQGhm2b0/gqysMsJh3rkeKjNQ1f
 sCGzZg8dnfKChXGhp1tPblzEPbWSAKJvYgM+LSIdoYuf/9eYaOoByQ8bGQ2SiT7pwU6x
 qDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=OoSAyLqOzoTY4imTMlt5PXtdUH44ZwugWLFtgR1oxSE=;
 b=qICDbnHsbVK10G8iDlPKwEtjUntqCwjFwbZXFV6D+e3vsxxraLtPY6W98UwmkUYVLY
 e6qhqbhu763rva1Ao5numuRoRF1ZGT3TxSCL1z8r4PIFFQQ+lznfmUkCPXOQ8PIGI+Om
 ByE393F7u2w0CXYwFnFoP4+7e6CGlwSJVA2LKrm9EnZK2SPbrgwU8HlupSPo85t9nk78
 jM5Yf4cNE/iUacB69Yz6g7qr+BcXvywghT4jaoaxbqXznKiGKM74Oee0zLuwXsFNeDqW
 JDmBqbghwT6xfWZ4ltzDB3Vzs64hKzyP3hTXc5gzTtfhIjUFgVU/5KqRZ39sSfX3ZlsV
 YwKQ==
X-Gm-Message-State: APjAAAXkwRivhPnyn+nSd+nUMnhMic9ptMApnYWML+Zxr1a61tOxXC2q
 IyZbdR1U5xkJaCDpMmY+vxSWr8So
X-Google-Smtp-Source: APXvYqwMoiauZe5i8ofLrMADrXvHo3BJVxcQ/isefeiLoACkGMIXY53jBARJIbq4SNGDqLdtRN4n2Q==
X-Received: by 2002:a63:e602:: with SMTP id g2mr168941pgh.172.1557347204831;
 Wed, 08 May 2019 13:26:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 18sm141094pfp.18.2019.05.08.13.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 13:26:43 -0700 (PDT)
Date: Wed, 8 May 2019 13:26:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: stable@vger.kernel.org
Subject: Build failure in v4.4.y.queue (ppc:allmodconfig)
Message-ID: <20190508202642.GA28212@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I see multiple instances of:

arch/powerpc/kernel/exceptions-64s.S:839: Error:
	attempt to move .org backwards

in v4.4.y.queue (v4.4.179-143-gc4db218e9451).

This is due to commit 9b2d4e06d7f1 ("powerpc/64s: Add support for a store
forwarding barrier at kernel entry/exit"), which is part of a large patch
series and can not easily be reverted.

Guess I'll stop doing ppc:allmodconfig builds in v4.4.y ?

Thanks,
Guenter
