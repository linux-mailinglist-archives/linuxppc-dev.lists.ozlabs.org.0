Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B7159FA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 04:46:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HQXl3lJwzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 14:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HQVr1GR8zDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 14:44:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=TFl8ycTo; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48HQVq2L1kz9s29;
 Wed, 12 Feb 2020 14:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581479059;
 bh=vHvxgr9Mi4kVU4CP+DLd8jLZICVO9UpdLx4IRY8/qAc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=TFl8ycTowgf15CJA30P9wKR0Qk6bpdlEFhoGn9MjMkQU7T5LYHPkWySg+SlXE12X3
 fCQ8pfyWR+gG9m4Uy4Y4i4EKfy/CVMLaLn9jxyAgyKMetLmhUwlY4HdmQzYTCRzrtM
 xuchTnNhSJAPanXtVv1RgVhjOxKX2UQNMLabej6VAK/a4BGMQjy9/apaPx0XwaveHW
 OVB6OMj6MrpYDq0th8hozc5uL6zdrEhHqkWj3SGYC/siPo6uQHt73MusUoX2wPc1dE
 UMjwTYu1mguWl2kJuI7Fs6+VBsC3vgsSIPk5De0QISt60MKI28PucWHANsN5APwwJ/
 6ikU8sJMHnonQ==
Received: by neuling.org (Postfix, from userid 1000)
 id B4D462C1FF6; Wed, 12 Feb 2020 14:44:18 +1100 (AEDT)
Message-ID: <c88cd4e86f3d1874c277b5052e030625dd373f90.camel@neuling.org>
Subject: Re: [PATCH v3 1/3] powerpc/tm: Fix clearing MSR[TS] in current when
 reclaiming on signal delivery
From: Michael Neuling <mikey@neuling.org>
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
Date: Wed, 12 Feb 2020 14:44:18 +1100
In-Reply-To: <20200211033831.11165-1-gustavold@linux.ibm.com>
References: <20200211033831.11165-1-gustavold@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Found with tm-signal-context-force-tm kernel selftest.
>=20
> v3: Subject and comment improvements.
> v2: Fix build failure when tm is disabled.
>=20
> Fixes: 2b0a576d15e0 ("powerpc: Add new transactional memory state to the
> signal context")
> Cc: stable@vger.kernel.org # v3.9
> Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>

Acked-By: Michael Neuling <mikey@neuling.org>
