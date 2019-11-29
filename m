Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEEB10D782
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 15:55:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pcy52m7vzDr9L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 01:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hMUZ4aXd"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PcvJ2RpDzDr9L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 01:53:16 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47PcvB6MnFzB09Zt;
 Fri, 29 Nov 2019 15:53:10 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hMUZ4aXd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XnpC7onj2i1L; Fri, 29 Nov 2019 15:53:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47PcvB52GTzB09Zq;
 Fri, 29 Nov 2019 15:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575039190; bh=C9qHRC2OmRsVO674EVzJC8ZRALO7qDaNoXi/6fn9Hv0=;
 h=To:Cc:From:Subject:Date:From;
 b=hMUZ4aXdvBS/0nRJH7MNGSgFKVDU/FPm1rUFedtxjbTOi060NfFdy8ouu8c7Eh5RI
 ku9P+IGf6U/4bSXMaYifdoFxMl229B4jZrmpMpdKsCgS+Bj9xbc5BKnSwoVwShCIf+
 DCF8P08TYsOZpBX2/TyaSGyIMuqRnaX0WZhVv54Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E14B78B8DE;
 Fri, 29 Nov 2019 15:53:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1lPhm1XL-pIn; Fri, 29 Nov 2019 15:53:11 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9894A8B8DC;
 Fri, 29 Nov 2019 15:53:11 +0100 (CET)
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
Message-ID: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
Date: Fri, 29 Nov 2019 14:53:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

   CC      fs/io_uring.o
fs/io_uring.c: In function ‘loop_rw_iter’:
fs/io_uring.c:1628:21: error: implicit declaration of function ‘kmap’ 
[-Werror=implicit-function-declaration]
     iovec.iov_base = kmap(iter->bvec->bv_page)
                      ^
fs/io_uring.c:1628:19: warning: assignment makes pointer from integer 
without a cast [-Wint-conversion]
     iovec.iov_base = kmap(iter->bvec->bv_page)
                    ^
fs/io_uring.c:1643:4: error: implicit declaration of function ‘kunmap’ 
[-Werror=implicit-function-declaration]
     kunmap(iter->bvec->bv_page);
     ^


Reverting commit 311ae9e159d8 ("io_uring: fix dead-hung for non-iter 
fixed rw") clears the failure.

Most likely an #include is missing.


Christophe

