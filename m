Return-Path: <linuxppc-dev+bounces-8155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A687AA1281
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 18:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn5yH29vrz30Vn;
	Wed, 30 Apr 2025 02:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745945671;
	cv=none; b=cJFj+gyldd7Ew/cNSKiXXblXk/iS5yZz4fwvC6MhBG6eFmT4TwGo0OdyjMcrFrQLHOia0ms28B9ac5I1X37DsF0BKoGeFCSgwTD44T/ThsPSpx1rH5JPStRkbd6lFVnJISlC6/yboawA0Mn04i5YefXyaN7DMPRKqk2AK7IF1GPChCc0Y76Fstuih25Ef1/5eaN9+3WoEe6NAzJlV5BVMXZu+bcFUzPIat1vYYZ3NJAwe8G1QzkDFt5LHAOnsGdaCUcLX15fqtLgRV8anJnxQfB47fzMRlBt6njSWjjC+CLtoueuC+HMzF5jswMbxXRW4sPEMfZe4j1xIueG/olAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745945671; c=relaxed/relaxed;
	bh=CSJ87QP02yGhkp48cz1m9o6mISOrqhmhfxQe9Uq5Mb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZApR0E1EN3GlkDLi9uNxY4xWzQxLitwBSllmGjX4aNVxuS+GUXQol/2xAh6e5KMi4nPjkTPDzHkKgWHZaWjCaWdr57dbYHnfWnfi5J0sMlBHrMoi/qPWmx768etC/FUUbxOd1O0VONdA7Q/w6ypfObJ69a2JkgG1ERLAR5OVv7ha4M1U/6kdOP6hSE4XO9QbcWtEMge8wLGoAgCHbeklYX5bfnPlUgivtVkqolbDHGh+B0Z2ZMlN7DBd/Qx2BTLZo1KUOB/A1rHVSUJhdfACG0n0AulsF3rZWms8rXbOTVrBvX+cjcMMrQ0uO8z4fyMP8Gu1hQrUaSuV1GIAp5HAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oMCcA1od; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=timur@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oMCcA1od;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=timur@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn5yF5Chrz2yfv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 02:54:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E86F8A4BB43
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 16:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE39C4CEEE
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945666;
	bh=AdoYyKISP36xJeQD9woyN2YEZghocYxvykppZ9AflqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMCcA1ody40ilGXC0Qybb7DD6sqJxB52dAXTz8M0wbK6IB+bf8EDHo+zzXnykV1B2
	 ZI1MDHferuz/WYILmf64MfVy+QwDtMwoK9hJu5FENIHEjcHPdsmJr8V+2NcyUZWQR/
	 Zdf6orSEajxT7dZqQA6CDJXGCy0o17kNrAxtAudher8AP/WyxvfA6LVxGJvT4OZ6pS
	 0bIxAIDtB15QnFrdc3oEUAdhVzZGoHIszrH1ZT2KmV1CIzLZA5KlnpXlD58F78ji4B
	 Ov8zQU6zZvoTI9gS8fwNBEguGszOBuHXgZ+V74f8H1IwxjKGkr04VtKNjQAL2PJNdg
	 FAAdjY9cCvHBQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acbb85ce788so1222738566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 09:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZwSCTiRW18ARC95giXX7Lkkkn0zX0bCTxuLGUQiYBTIfMhxEbVmvOBHAVUWIA+LBDk951BK/BnqlQ4/U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdYrA1rXe3dO15GE86/4QGdKuqaVaq82QlwnSmlfNDIeGYnszM
	S8lX/GHwQC/ZOBTQjpII2PMppHR5QE4YqurmYQTQfGYbxqAp0KcNR+doQUAzHsLguBorhvfbWV6
	fJvwtBdaSkdTK6vHCH/RauiQEJe8=
X-Google-Smtp-Source: AGHT+IG7skFkYmrh78r3PBufunbwFhCyH6bMAAQyF6iwtL4SiSNbNImHJcW3bMTneYB2TP8fzRb2vISMbXZRWbUX/Vo=
X-Received: by 2002:a17:907:3d0d:b0:ac7:eb12:dc69 with SMTP id
 a640c23a62f3a-acedc6226e0mr11217966b.28.1745945665026; Tue, 29 Apr 2025
 09:54:25 -0700 (PDT)
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
References: <20250428105657.3283130-1-wei.fang@nxp.com> <20250428105657.3283130-6-wei.fang@nxp.com>
In-Reply-To: <20250428105657.3283130-6-wei.fang@nxp.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 29 Apr 2025 11:53:47 -0500
X-Gmail-Original-Message-ID: <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
X-Gm-Features: ATxdqUH2vDIYWUftzeH4CwoDWqiZzAE9yKFOOu8ghijiqo79WRaU9jaZG_afqrM
Message-ID: <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
Subject: Re: [PATCH v6 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 28, 2025 at 6:19=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
> +void enetc_remove_debugfs(struct enetc_si *si)
> +{
> +       debugfs_remove_recursive(si->debugfs_root);

You can just call debugfs_remove() here.  debugfs_remove_recursive()
is deprecated:

void debugfs_remove(struct dentry *dentry);
#define debugfs_remove_recursive debugfs_remove

