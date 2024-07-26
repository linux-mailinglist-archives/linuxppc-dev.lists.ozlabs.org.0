Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 654AF93CF3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 10:05:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ebnWqam3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVgKt2Yszz3dBM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 18:05:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ebnWqam3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVgK83lWxz3cG3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 18:04:59 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fc5549788eso3412035ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1721981095; x=1722585895; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TYWIXrzkXVZZkZdz/QrKdM2ifv+qqqsEjLpzrowXvkE=;
        b=ebnWqam3LmPAFBjXyFGCXBWWU/LKUtbzKfSjDq16FN0XVabFYYI3bTya4DEC4yI8zj
         kma9vnnHUEL/b0ftth8tdCMibh+M4EecNVMlcnga/QCVIhrtC1AVL/0r+hcy8DYbRf/0
         Tsudyea0C6KVHOj2hjf5ZO5NMViVJnLGe/kWmp0nsQvDudQvyREwtS6P45bavjRyRgHu
         1F8aRUdKf+K49WGZqcjNFs5zjKCNaF0LzRqZsZBR1cUeVU5JQRppY0oxajv31jF0CNn9
         fh/JnoMekZ1GGneKlZVlysSHccRWhZwIOYdB8l4VXSPYJWAASIpGUHQcMr5Qk6GVpR+j
         GkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721981095; x=1722585895;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYWIXrzkXVZZkZdz/QrKdM2ifv+qqqsEjLpzrowXvkE=;
        b=UYC1mZdeb+nPUP42BBUXts4T8PR+wHe0v++IHB2D9LLY/qpzlnY2fJU346wSUm0kDM
         7k3rRXizFIYurN2JPl7BhdHp0j2sCJCO6qcK67/dOALn++4gCJLE2faYGREJpSwJa991
         WfvLLJLFc4/dXg8oOwgIC+dkXueKvMA6rofD3LCc1M07TQCSkfgcARFV4iJyYRIqOYRO
         W3ZjpglfMqQVfmlwRm14DlnxZfuaVu3ruFRBlrDpJwtebFts/JzNNSLqbviK+w+sw4xu
         dJjk1qMayHj3FcYZywtYaQPS0JwuaJOJ6VBv9llebZsArPH4tu/oAwf/eg0X3/IRcR1z
         +vIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkCmC0T+Aj97Mrj4cqCBmkfXjDfBd3h0ovXVMEjxkZ7TG5MR6PGrgMafYGgm+LINtwDLE6xiZkk2ho5G12fowME919k1xwKWVX6ApUPg==
X-Gm-Message-State: AOJu0Yz8B/0+c/YZQ1V+XE9Yl12iYJDwgu8mOgm7HsnSbmHWlGjN6bvI
	CvseSQ5dgnVrpDGjvEszDTl6f8PDyMo6CfJjRjXlLMAaDCWwkE6ME9yASKk/6Do=
X-Google-Smtp-Source: AGHT+IEThCF8MbTWoYXIfCiu9y7Wa9LyskvBWhr5h/HfiuuzcdkiOmRFKdkB2FSE+F5WHhuVNo59Hw==
X-Received: by 2002:a17:902:f685:b0:1fd:9fd8:1b2f with SMTP id d9443c01a7336-1fed90b8c7amr55949925ad.8.1721981094597;
        Fri, 26 Jul 2024 01:04:54 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1fed7d37b9asm26186495ad.114.2024.07.26.01.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:04:54 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Subject: PCI: Work around PCIe link training failures
Date: Fri, 26 Jul 2024 02:04:46 -0600
Message-Id: <20240726080446.12375-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240724191830.4807-1-mattc@purestorage.com>
References: <20240724191830.4807-1-mattc@purestorage.com>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, npiggin@gmail.com, alex.williamson@redhat.com, ilpo.jarvinen@linux.intel.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, pali@kernel.org, david.abdurachmanov@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, mattc@purestorage.com, saeedm@nvidia.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Jul 2024, Maciej W. Rozycki wrote:

> The main reason is it is believed that it is the downstream device
> causing the issue, and obviously you can't fetch its ID if you can't
> negotiate link so as to talk to it in the first place.

Have had some more time to look into this issue. So, I think the problem
with this change is that it is quite strict in its assumptions about what
it means when a device fails to train, but in an environment where hot-plug
is exercised frequently you are essentially bound have something interrupt
the link training. In the first case where we caught this problem our test
automation was doing some power cycle tortures on our endpoints. If you catch
the right timing the link will be forced down to Gen1 forever without some other
automation to recover you unless your device is the one single device in the
allowlist which had the hardware bug in the first place.

I wonder if we can come up with some kind of alternative.

- Matt
