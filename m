Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43523CE0E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 20:10:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMKRc2Ql8zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 04:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hWqfthpN; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMKPd4CY6zDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 04:08:53 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id r19so12660658qvw.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=TKYRPGPLHCWrMIu7pyuuJy9bkPwY7mqum0/IqDLNX9Q=;
 b=hWqfthpN1kxgRdozFdigqWZhlrxM3Bq1/DKEB+wrmgW9FCiv+nTg28h85JfxbOgHfC
 v0ucln+sfvTxDLrxy1ePEG/JlHAlg1qJw55Ug67MVO3aRIoUii7J+1tSAQN6cpRwMvv1
 mEJ4tOMcLyuUYE73d7ak3ql37HdoU+Mum9Kt7dcX3CgEj7aa8qPDzxVVvkz0IxiTM0PU
 mRW58XLvYxRYNaw/w8nqo5r8IcG/uXrQHK9FdTkt8tzAIcI+etjkH2HpNR5u1yDxrQCb
 xk1OdDdHDJa6fVPvt1+f/tHKyZwxgAj0iYv17wCws+h54H8NqPoazwhYXap/HQVax9IN
 vBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TKYRPGPLHCWrMIu7pyuuJy9bkPwY7mqum0/IqDLNX9Q=;
 b=C/L4jzkkp+mQ2RZmabPzqrZBbpexQG5flUun1dFkOSdUbeI3BpwG3Rfmyhu3XD+wvK
 pqhaikh4lxRjV/8K8wKFfzv4WxvEo4b7V2jfqN7zPRLj0vxIHODQzvC81G8sTWxwVswe
 HMQJPKJbfNkHCwM8MDb9t4KBOhWh/g+8+deStFA3/9K5xsxDUmbVwLJgn6LaPRhNfJZv
 zwRQKMY8Xp9qM/CyRiDfJ8ZSl/4dapePjh/MexgHEAxI4oiQ/K1lzhuH6LIZlrmVEY+t
 hqjU++o2f/SjFCtEyvWpeNgt4MjcvCKwgxpJI6aW3WZhVwixMVA8ukVL+KNaPve0qsGr
 Bg3Q==
X-Gm-Message-State: AOAM532FfY8Cr7trc88d9/Oemf4VMQKSVc6P14tSEa7tWYZU5jeLDY+f
 Lz0KAII36SuVsSdllHPM0Jo=
X-Google-Smtp-Source: ABdhPJw0E/iVtQf8MQPZ3yxGZTwFzEI5nzK94oaCcxa5kXq+Gaoi4HeL8nChAJTI+0bZaA1JiLqI+Q==
X-Received: by 2002:ad4:446d:: with SMTP id s13mr4966591qvt.183.1596650929271; 
 Wed, 05 Aug 2020 11:08:49 -0700 (PDT)
Received: from LeoBras (179-125-154-168.dynamic.desktop.com.br.
 [179.125.154.168])
 by smtp.gmail.com with ESMTPSA id c33sm2744722qtk.40.2020.08.05.11.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:08:48 -0700 (PDT)
Message-ID: <e60591c023173ac04057293962c498a09acc1fc1.camel@gmail.com>
Subject: Re: [PATCH v5 0/4] Allow bigger 64bit window by removing default
 DMA window
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Wed, 05 Aug 2020 15:08:42 -0300
In-Reply-To: <20200805030455.123024-1-leobras.c@gmail.com>
References: <20200805030455.123024-1-leobras.c@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Travis reported successful compilation with mpe/merge:

https://travis-ci.org/github/LeoBras/linux-ppc/builds/715028857

