Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B38E1D0660
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 07:28:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MNVX443WzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kOl2Zkk6; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MNPy6JXYzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 15:24:06 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id c64so16159981qkf.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 22:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version;
 bh=nnZJ9ytuC5Uycj8aFhU9wwgAOq8aeC8OZx9d9mFcTI0=;
 b=kOl2Zkk6RXIICXsfORx0T9kg7dAsFx7nEEsR6a4xtaZ02wAyMk/uTi9NudM2aYID6n
 n9f5OX6ba8W9fPJgCbMuZJ4UsdLns0a4Lzi9zfsIFfy8ZkTp0XpR/yyV0br9KbpUFbSL
 7zhoU1HT1BwbmLLN5X6FnxbNl/TcvMpMfrzGs8GB+JzV327nvqqSiCGZb79RwSDB3UgO
 DRgPvAQ/qVlR2GiP7aL9qSJh91Hwvp9nUkPcka7OjiMlg196cQMQ/dnMyWWCrcmYbFen
 NawHDMEXUPFLYmQdlMqjVb2OlmSIDS0y55sMPzCT3+i2IRH4Wg8c5S/La55jWgXRbCbR
 rmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=nnZJ9ytuC5Uycj8aFhU9wwgAOq8aeC8OZx9d9mFcTI0=;
 b=imgKNSTnJzrlrKH6v7rK5aMmHU8PyHi6Z1hoIqkZHwaJfpK4OM/dHzlkEc9+Arl5d4
 0Gxboiyv1xP/1H+wFq1c/xA1VcO9ymExP0eKhlrVwe0ksMa+b5nJwVAqt88YyNjK1MsQ
 USS5P80DCmtxEhaY/NQhVGuxchlU3CA0ouswb4Jp4H+Yb5iG47Ayapa1EUIoF8C4Gs1G
 kYYktoyGL9cmDk8Y8BBaUzk7pQfJ6P/wHCUtwXIyk71Yv34oGBsTngfpQdXGlafpMVQg
 Br+A7WfavmX/Xtcm2d3v7RLL1yk14aoRMiU5pqmpAGHofC0TcPXVAcot52mhX0Uvpc0b
 HQ2w==
X-Gm-Message-State: AGi0PuaE+F5zxdrttZbEEpNCq28i27oB66i58S8KP174ocD8kxYgZbvv
 c4f4t5PErynKTQmql7PmGiZBGnQD
X-Google-Smtp-Source: APiQypJRakJjUuMP7CQXcb13k+uyoKjaD35UQXq1vc28JJoOu5g9vuqBcWzrllzpuElOOwjIOic0vQ==
X-Received: by 2002:a05:620a:1414:: with SMTP id
 d20mr21369118qkj.160.1589347443160; 
 Tue, 12 May 2020 22:24:03 -0700 (PDT)
Received: from LeoBras (179-125-143-209.dynamic.desktop.com.br.
 [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id d9sm13315057qtj.77.2020.05.12.22.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 22:24:02 -0700 (PDT)
Message-ID: <d3dc85e3e3ecf9c25718f1390041f78942f853c9.camel@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/rtas: Implement reentrant rtas call
From: Leonardo Bras <leobras.c@gmail.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Wed, 13 May 2020 02:23:47 -0300
In-Reply-To: <87ftdb87jf.fsf@linux.ibm.com>
References: <20200408223901.760733-1-leonardo@linux.ibm.com>
 <87ftdb87jf.fsf@linux.ibm.com>
Organization: IBM
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-JtQ8M0UIKnoBiZIEQuF2"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-JtQ8M0UIKnoBiZIEQuF2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2:=20
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200513044025.10537=
9-2-leobras.c@gmail.com/

(Series:
http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D176534)=20

--=-JtQ8M0UIKnoBiZIEQuF2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJIBAABCAAyFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl67hGMUHGxlb2JyYXMu
Y0BnbWFpbC5jb20ACgkQlQYWtz9SttREexAA6aFoNm/YDldZvZA6JFHqeKwJuWzI
X/ylsDwGqNWHNGFbcAlO5QmIucGkwpZyaakMwQUSp5s5Qom4Uh/CBX8E/ruw7T8Y
JLYn/val+t+8M/jWsXnheL3Cz5sCSaGTlrrnMxo6Rs748mCB+WHs9V+Ut57Z7Y7L
iIPkErE7E/QSPSjeRWDCe5fbHxFUivr2MQV0IZ2ZOssEcevGDz0OjKk4mOJT+3wa
vh9TZ1y12Pu5JMyXAAVL3ZbbHvyzDn3N9jgPaBAPJKEONep651raqSVOcc75vyq+
c8y6unsGJeHHQyzVii3O9LpPfZ3aTLJ1eee/9oHp4YN+qm5iwYDUMr1lNvAapyXs
1bc+tj7yXEiRCwh0kJAHxGdPypCjEis3IjjOGOP4J98KABSHPYJBENN0dJp9SYnQ
kKdID3m9vmniJZDE81GwPyTrz8EGsf3U9lGy6ZAVwODgS1SABFDPBkadBDq2b4ZU
b7uX3MCu3cuGVgruIfaiPRL9s3ObQLOLW5cUUURnhk+otblGu7/yxesX2iaZHAK0
qTJ632xx098Um39RHQLGNFGd35nf3hQ1UwFkM2Gu+1MTqDU7hcptGdYo43lq2rJw
oUQ6DPKpJ9Z5Ib/3MaVrZu23e8UTChZxizonQYMPLsYfvp4xqfM3lYIcqEO//uPg
7KsrKJWaRjrdD4s=
=sxAZ
-----END PGP SIGNATURE-----

--=-JtQ8M0UIKnoBiZIEQuF2--

