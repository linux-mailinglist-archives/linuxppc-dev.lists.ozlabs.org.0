Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F7C3433C1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 18:35:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3PsW3fnbz302d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 04:35:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zoso+9Pa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=zoso+9Pa; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3Ps06zxsz2xxj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 04:34:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b6kxlAh3fIabeLvigmFVk68R8rwvjb2NK7Orm1rRGAo=; b=zoso+9PaOZXk0kOw2FuTs66wdp
 6ZCwzxl4MbPIgWQNj2SM8rozWv5lm+S1GMySmBVrt3b01r9s335TsV8OW/OsXJi8UV6j6PUHUWDwS
 Qw7UVEJstdbnuL++Qz2UpOfUc8m6D6bjSGE4S/MeUMcEMLj/NrrUbwPPzjKRVcln74+eAh+C5kY9j
 r0sOQqvDKR2rkyhueQH9QgNAQTPCjp3xzMUWSsdVY7SqYdU5pEOB8jJx0pY86V4MrIuIpjtZFBW2f
 8H5cgzZw9b9x83VRXdYwwyIFNiexRHx5KyPuRG1EwLkHIG9xM7b9AdewQTr2fSlzE6gVNlCPNo6Dl
 ktoLcXGQ==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lO1xw-002QSK-VC; Sun, 21 Mar 2021 17:34:17 +0000
Date: Sun, 21 Mar 2021 10:34:16 -0700 (PDT)
From: Randy Dunlap <rdunlap@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: nx: fix incorrect kernel-doc comment syntax in
 files
In-Reply-To: <20210321123007.15505-1-yashsri421@gmail.com>
Message-ID: <84443584-2cbf-5945-2b6-b7a057a72540@infradead.org>
References: <20210321123007.15505-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_103417_013224_F9F210D0 
X-CRM114-Status: UNSURE (   1.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "bombadil.infradead.org", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Looks good. Thanks. Acked-by: Randy Dunlap
 <rdunlap@infradead.org>
 Content analysis details:   (-0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au, corbet@lwn.net,
 nayna@linux.ibm.com, linux-kernel@vger.kernel.org, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, leitao@debian.org, lukas.bulwahn@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


