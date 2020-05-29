Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612B1E86FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 20:54:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YYdd3yqfzDqmC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 04:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=cdiSse1P; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YYYY0sH5zDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 04:50:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590778220;
 bh=UL32KuhwgA9gsYKLuuaX/k0IohfIBZxApPFFp+4MzAo=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=cdiSse1P56do6eA1efEbaoJUOFyS9IuJXD3ys9W5OgdezFQ/r1Tk9HI7z6LUh1LAR
 V8YPqpG16csNmhIWdofcYrI6IdtmqILwbqS5dQLU5c/eOSi4vsk0yXqhJCVGrt/9OW
 lRF5mFCGOuhxImDNY1EOzU/YST60WaQD2l3QdPEY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.165.0]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKJAE-1jgOmD2W2Q-001emd; Fri, 29
 May 2020 20:50:19 +0200
To: Michael Ellerman <mpe@ellerman.id.au>,
 Liao Pingfang <liao.pingfang@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error
 message
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <c3d22d89-9133-30aa-8270-c515df214963@web.de>
Date: Fri, 29 May 2020 20:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:pLSWS57+vH0y6xST2tG2yU1Ndv7GYSUBCw0iIVXLyKF1PSINqTF
 rPdNNIik0ekH3wN5ewmfBmdbnyqbYNyRjiNdIdVxUmhSdOxzfI8SACrxiupr59J5tG9JbK8
 nY439lgkBsVQUaKGUEt5qrTarpbCVL0OPKBSvLgDHMCHS87uJtC5RaCtpQ/ubYenYmrXuXY
 orVIaifah6f2tw+8pPbaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1obo/2cYErc=:fB2R9vm3UwkLNGk1WL5Whg
 ZBepAv9JsJxWjEp9mL5RBcwSjuiNgqkRa2XPZfCnLpwDs25zxqeI/josesklmpbydN2kBp0tv
 aGnHhuKlOkUv0vlH2yIwRtcmzA5TFgtWoMGSiijnlN24wgARi3cttaUwkEK9yXDy3J4chxGAz
 m10jaJFb04s5qEnimyVn2m+/gR7k29dQm62irDPssETTv8rEyfIqyebRE9AbSB6hEr6WCsifO
 BolxSWLcWl6IY4MVHjBOyuXWYHl5X3dK6o4EmtBpRvsRUKovkPpz3yChHAdxWkWmSUyD6qdsT
 XUR5edXHk9G+f6OTA9qXXrwZ7NJ+rS/bHjqqhTzrD7oCRRLcLfj3gD2OqIivyKJwCwI1OWoJW
 icd/ffhPhAOulO+25itO1z42UsKJ1rPniekycTDi0XAEgmEnm28BdbQkakAT4RNQWd8BgkjX+
 PBjbNl9n+kaKjfrvYSJ/CBNm5hGeuRtx61M7v2aWx45xWNjLmRX1Qei7z+rzk5h3tE5z1EkB9
 2sZqlxXU8ObC/hOB2KGsbaR3zWSOhMyr/4IfYuynK6vHtxn3615hnRUbWy6lpVKgTCXxUj+D0
 dJrTDcVMaW09BcyEiL/3blRZxs26keb4WiNG3KrMYHykOiOIlnG5L+FAOaQef9kyA6Kff2Yal
 w87YNdyOoSjXQWSTNxmPu2NUWlzRJg86u5j4gpv0mir3tdVWN++RfsTXwyNdxkr6r2EfrLm9F
 2s7xoxim+kylCfJL+CdIi4Lz94RJ+4lKSHiZFr//CcSS/S3/Jk6zxQIYZ4XkLbm3d68zE3OJv
 cfc8nhcwPVeCkFPigIIftQDbvKiNX+9VG8iJvjZUQV+li/BZxUtTYns9qcMeX/hQL/kJoJjxh
 sjbkv8CilolSEQhPb8Q6QJppGWjOFmMXQp3ilrnQlNH/iqONuhrlZmPkHvIMBoDEd4gVagGm8
 WNiTcEtGtq7vassxlquTm3L+wmisITkLjPlx9xOgz3FQR5cznmBrA1/CIdp8oDW8Pj4evh0/F
 vsO9Ea88pPZ5/8DWUskgwU68WwN1yFFMOVHqNlDFcKSbHOLtkzgWDxBFVesf1xyZo3u453069
 xf4QOHOdlf/ZjVQY6c8DVyGm3Ho/Qx1Jt3GE/nxQzYYjw7X7G3KZl2BlW/5bAgZOGk8DqI1Tv
 xacTknC58nRvyyjfnmibodO28DeWNe/V9On8phCwXqTEJEEWcs0EwRB0qRO/HKjtbWUEoVWcr
 aSVN04K8mNSvN7GQF
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Wang Liang <wang.liang82@zte.com.cn>,
 Anton Vorontsov <anton@enomsg.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Please just remove the message instead, it's a tiny allocation that's
> unlikely to ever fail, and the caller will print an error anyway.

How do you think about to take another look at a previous update suggestion
like the following?

powerpc/nvram: Delete three error messages for a failed memory allocation
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
https://lore.kernel.org/linuxppc-dev/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
https://lore.kernel.org/patchwork/patch/752720/
https://lkml.org/lkml/2017/1/19/537

Regards,
Markus
