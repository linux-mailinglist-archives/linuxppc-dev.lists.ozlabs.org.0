Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4EE691DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 16:33:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nQyD55GKzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 00:33:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="YDX5Cni6"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nQrz5cxHzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 00:29:23 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id h59so13289502otb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6QkSbJ8pehcPJsEqSW/0Jw3Kj7WtEh8gEc9PVJH1CrA=;
 b=YDX5Cni69En7Hnte+J3OlCSJ0HlBPkTtUerLm+TEt90UKpDUfDuJvjCxyA/xsbdN+4
 NlM28WRfcpu6byVaPN4oE7VH4s3k0vd1hEb+a57aabIHxBzldliL2Htoq2btKjK4n7AS
 dEk3INMwrusBqXJOHjVd5y+1ZYzs3lAeIPfrwgpru+b49OUDLgXf6+CpcsZ6fG8itG0F
 1l0rPwOFa7qBIOGncKcrTTI0b32v3jNfOV6b+s6CSQAQGdFNyL4RrykbWCb0WlSmG84g
 rPg2y0ELpTG/hNU8ek2ztwI6ffWkYO0HuhjiHpT2javBLichO07Q+0RuqzlaxnSebk5a
 7e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6QkSbJ8pehcPJsEqSW/0Jw3Kj7WtEh8gEc9PVJH1CrA=;
 b=LxdWOEzw/5rR4F++bgklwg3cggGe217lJO0Q+l5KVgW3Sx+1ftSDe4Kl18RTlrkARj
 uxkhCd5Z7WQczaUZcHfQf5NmcnF2HBhXvNVXNNA5X9WF5tyw5A2Pzsgd4TCKXCNQqGpJ
 OSjL4VpBRXj9xXrlQDZSNIKHDH0P9b93hGauAdDjOBkVEfxlmOshe3mmepoCDNF0bPz8
 yCutgAN7ZA5kKpNbb9ZrNuu2JBRiJ7PhgvWByftfsuetGVSiMDzGN+gtL6LDPiLsH5tr
 Hr1A0qYC4SU6dRvSGJW/MCGt1VWJRv5oLqi940e9ePtWK3xnupjBNNnA0VxOadDYeqc7
 EVvw==
X-Gm-Message-State: APjAAAXIDBd+sKae/luw6cKDISlmpgOuV/10zRwOHXcVG1F+Nis+3bIa
 Vz0XTZo6l6rfHzU+K2M1t4s=
X-Google-Smtp-Source: APXvYqyjL0Ot/+YneSRjZE4d+NlwotmvVCLCkSyihKbIEGxxfUrBUzxa4ggVFEdDWrNvLtFCu+w3cQ==
X-Received: by 2002:a05:6830:193:: with SMTP id
 q19mr20811013ota.187.1563200957973; 
 Mon, 15 Jul 2019 07:29:17 -0700 (PDT)
Received: from brauner.io ([208.54.86.135])
 by smtp.gmail.com with ESMTPSA id a94sm6577090otb.15.2019.07.15.07.29.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 07:29:16 -0700 (PDT)
Date: Mon, 15 Jul 2019 16:29:09 +0200
From: Christian Brauner <christian@brauner.io>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
Message-ID: <20190715142907.7p43dgmx5sz5oouz@brauner.io>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
User-Agent: NeoMutt/20180716
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Vasily Gorbik <gor@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
> I think Vasily already has a clone3 patch for s390x with 435. 

Excellent. I'll leave the # 435 reserved for clone3 on s390x in until
this patch has landed. It shouldn't be a merge conflict and if so it
should be trivial.

Christian
