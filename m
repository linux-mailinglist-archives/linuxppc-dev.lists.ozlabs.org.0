Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968E18ED91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 02:12:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lxDn1QL1zDqbw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 12:12:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GeKYicoA; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lx9w47t4zDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 12:09:40 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id bo3so5297500pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 18:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=zZimFsnT8tTeoVMg/c0i5qIbQrifpOcykwSLEByTdDE=;
 b=GeKYicoA0ZH2VhGbmvvx7tp2tFQk99Zxsl5jubH07TiXvMunohKVQ7wan9J0nWFo3k
 FWc4qVfOKXVUHeyx9iK8Mf7hYaHN2a3OTGCmL7z3sLGS9VOfGhxL2/E5Iupj8OdfsXO4
 wI5zhL454zn73/3fPRykeiu+EFyqgUVWFARo0FQ/VZRAAddIZ+GDZggG+L9l0NO5SMxF
 /OjNfQWlEbJevHpPteCZiixTA4cr6jNAmhE+R+A/6aQjLH7XoUGwASxDRYopSDeyOpXk
 wjmMvR5RtS2fLDG3RUAsdbmvvY16GFRl7JZUKIGg9swNrwYLoT81hCuZp9cawo4B7kVF
 pgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=zZimFsnT8tTeoVMg/c0i5qIbQrifpOcykwSLEByTdDE=;
 b=G6SrQTp2gWw++isCzkZc641T2hj037eGNcq+VTOETBwmS5wIadDBG1UVF8YtTLYHE5
 S3q3RSVYmo2X4/qH1m1+4cEWbCUriENlxXAQ4YpCfMbu/gOwbUSch7xTBdNcCwGQtpcJ
 XQZE9EmP2NmvLy3hh/fCEthj5goAUigrpBzjr5f0jyB2yXMBdL1tePkCpnWx9G6as/0C
 xops9EMW3GUiPSW/UPXamaVI751vHeljC1+qoJO/pILX5YsIN9xsUbpD/ErNB79A3zrx
 Z+fyIRr4049e9nI48e0ccsFExGqAzxFuJ5CzLzRCaeQ44tfJ8upE8yizEvh91PaudWKb
 RwOg==
X-Gm-Message-State: ANhLgQ0P6MV54dlORh5S4H2OYZbuAS+0oIhxNFWW2VWkNwQ64idIcGwt
 LTLr5CbtKo7a+02LWOSGpSE=
X-Google-Smtp-Source: ADFU+vtJfDS5rbiM9iJeh6n8kWcNxB5fn3+o97kHPUoTrVbgTUzRDfMlXzgVZSpYktVd9rXLuCpgMg==
X-Received: by 2002:a17:90b:4d07:: with SMTP id
 mw7mr22336449pjb.94.1584925777260; 
 Sun, 22 Mar 2020 18:09:37 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id d71sm11874180pfd.46.2020.03.22.18.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 18:09:36 -0700 (PDT)
Date: Mon, 23 Mar 2020 11:06:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
In-Reply-To: <1584598473.9256.15248.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584923504.tc7m3hl8sq.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 19, 2020 4:14 pm:
>=20
> Alloc IRQ and get trigger port address for each VAS instance. Kernel
> register this IRQ per VAS instance and sets this port for each send
> window. NX interrupts the kernel when it sees page fault.

Again, should cc Cedric and Greg for XIVE / interrupt stuff. And
for patch 2/14.

The changelogs could use a bit of work. They're hard to read, and it can=20
be a bit hard to decipher "why".

  Allocate a xive irq on each chip with a vas instance. The NX=20
  coprocessor raises a host CPU interrupt via vas if it encounters a
  page fault on an effective address. Subsequent patches register the
  trigger port with the NX coprocessor, and create a vas fault handler
  for this interrupt mapping.

Don't know if the technical details are correct, but something like that
in structure.

Thanks,
Nick

=
