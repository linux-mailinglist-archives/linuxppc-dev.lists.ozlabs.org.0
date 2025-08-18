Return-Path: <linuxppc-dev+bounces-11108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D358EB2B290
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 22:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PjK0pJ5z3chw;
	Tue, 19 Aug 2025 06:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755549605;
	cv=none; b=HsuC+RnxblwsEik/TrvQzYKQNn7Yr5Et52S/1h9p0J8S4BQJXbm/3Ph/me4yYzfHsQuhhwFrgAaXaHhZNN4XHA9CWjCrHNQMWetoY2bN7Dk6c96MP4TQM1buDHXLW1sBRHQGj2pUDythu/uVkbYQ2le4JKxWsIEGcTYWYjOXbDZWVdv0mdvnFUqWTdnQPJTmG2JuGCA6nkFnrSArFtorZ9T2IK/Qa9rmHCgwHkywTmjcSl9Cdj2d7TCMIH/akVVOvtMk+DtCyZvS1rxICg4tWTETGkWoXaBdamCwmvUgQP95+cfDc8T4KhtlAHVthxYVlNO314ZhxX3d7fmQqBanzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755549605; c=relaxed/relaxed;
	bh=Eo8mcJx96u8VH4jn7nXN0WzI3pTAqmoosY5GMUzgLRE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fdQ0xcl7KsCTRhS+i+HMyrPxQQhqnmQnrLJ+9ulGU0uBP6vuiWMWIdKuwi2iZgqD56/nM6T7EOo5H283pDA6OLDSNWplvBu+H/kpr4D3T2VxgVMChwoBsMrL1kIUVVNDjxojvuL0bvygvpRTLSb8DVW+PG6pMNYE9yqCjMwXVP1GK9PkqhmauBE+16zbYrknXwzusygGcWpN4xIB/9ES2KPPxnv+VLmR9CXqHelYv14P5MmSlBIDEUgonSfHeIdlmXRgetzUjv66XVPXpXkmnm5OWbxwMiaRuhRUtzxDP7pJqqNG6WgDzIt09CnYh2HAvlAazajMAkdKHJbmuEELCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KVD8PsPE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=justintee8345@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KVD8PsPE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=justintee8345@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5PjH2fqbz3cPM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 06:40:02 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e94cfaa274fso1340646276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755549600; x=1756154400; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eo8mcJx96u8VH4jn7nXN0WzI3pTAqmoosY5GMUzgLRE=;
        b=KVD8PsPEs2gSrG55cTD4RiDQTyqRygZByMHJE4qW3CyRSKQBlOhHeRXpNxD+mwcYiB
         n5evJglD0Ki0xA5K53R0XPp8XJzvSqM5iMePW4Svw2clwyB2b3cbSP2Ul+ZiQdBWD8sY
         93Eao1PQ2Pwg+scHGSBXyb/ncF+CC8BFZshNpajZ1PcBROQY1qn6NjYw1d2fKzSiEdw7
         dEQwbr8a4n6kWeOxdKgKYdaln0ue59GtBqLQKNFWZ/DfFYu+jhmW1J47UH4vhproj3Ge
         PyiZ3t2qvA0lr6+GudPQfCIFrSH30fO3Y80J+c/OqV9Z75BkA/DxsXdZ6iCF8M4bfbnP
         bxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549600; x=1756154400;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eo8mcJx96u8VH4jn7nXN0WzI3pTAqmoosY5GMUzgLRE=;
        b=JE2+tG+KT0xnkFylDJzkswHzysb8Ly3r6U0AkxwgkWjoQaeQizoYz664OQ8PC92Iz4
         FWgN/gTyXL/YW+Fwfub6c24Z2QfDtLg2lNpRGHV9ICSWNLQfu467AQAqkZuq2tBatDkG
         /PejTxtIBp3jANwVYpvpr5kaXEkusigs94NvI5r96kdVUFtyJbp+QOVIrdh72oUMVb1R
         EJEKSCicslVDH/6pL6v+DV3EXZseXSyQWgFgGvt1u2uVsgE1QJyZZdLh63hGnU6RwByK
         Ay6eLFWesWEW601Y/klIhpm4hlXNkzAB+/CsqrWIfC1kWMkiCpGWCGfOpzvjCx3f/A/Q
         fbDA==
X-Forwarded-Encrypted: i=1; AJvYcCWEM6Xok1bpo0IIhXM7Cn4SZajGOYleExDKPGB1kpudrK8GYbwppS8vM1A72NgsHsDloxyoraeblB2idD0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw775FejiJ+rT9kYt9mtUUCt80xOiRmaJfo4jHpf6Vc+6aK+XUy
	tROxYQBNX79t0DXPg6kILZHXeMsWCgS32MRHu24vuXxwFWGy8l38ny0ETeS0NB5agL6QYbiefLF
	4I30VKH6uD1tKiWKW7SKc4gC/KaneXdY=
X-Gm-Gg: ASbGncsXNKRyLGVAH3C8VvxgVCDObwfw8fOkxV5gjN55kUY7Cn9+Ew2pyZHGO2EjmqK
	iHGc8jCIiX1tb8AcXPhDyKlCGo2YqHVJ18I/TgQ3p2nYwnzH7xWUbT61Ubcce4KuHX/mB0JmooX
	OyCwz9ePPbsZjKRvd8gr+0PYSwXPRb5nQ6SQeTSmyo61W3gIvZcGsVrozK6Opm6ZnBJzK4z+NdR
	5SQETOK
X-Google-Smtp-Source: AGHT+IHAkrMwRZwdoy3Q6/RtnyzaiM2nQ7nvYBpI05C2SR0hHHKABaQ1e/OsdyKPymfqcGip2s/dKheOtKjQqr4m2vE=
X-Received: by 2002:a05:6902:6d09:b0:e93:4b5c:d50d with SMTP id
 3f1490d57ef6-e94e6284bd7mr364154276.25.1755549600338; Mon, 18 Aug 2025
 13:40:00 -0700 (PDT)
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
From: Justin Tee <justintee8345@gmail.com>
Date: Mon, 18 Aug 2025 13:39:47 -0700
X-Gm-Features: Ac12FXzDVK05Bcq9rvaz1Jfc1bgieWIBNch0-7wIMNa4XPotGC44yPqhEIVj_vg
Message-ID: <CABPRKS_Ut8Z+rvM4+-E0YvEwUKbMb0SDpLBdH+g1sYEh+YcxFA@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI/ERR: Remove remnants of .link_reset() callback
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>, 
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, 
	"Sean C. Dardis" <sean.c.dardis@intel.com>, Terry Bowman <terry.bowman@amd.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, Shahed Shaikh <shshaikh@marvell.com>, 
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, 
	Edward Cree <ecree.xilinx@gmail.com>, linux-net-drivers@amd.com, 
	James Smart <james.smart@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	"open list:EMULEX/BROADCOM LPFC FC/FCOE SCSI DRIVER" <linux-scsi@vger.kernel.org>, Justin Tee <justin.tee@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Justin Tee <justin.tee@broadcom.com>

Regards,
Justin

