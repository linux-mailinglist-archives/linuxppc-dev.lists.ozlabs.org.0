Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657C30DAE7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:19:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2Mq6RSZzF3rv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0BB3KVFzDwsn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:41:06 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09w67K6z9vGH; Wed,  3 Feb 2021 22:40:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>
In-Reply-To: <20201224132446.31286-1-zhengyongjun3@huawei.com>
References: <20201224132446.31286-1-zhengyongjun3@huawei.com>
Subject: Re: [PATCH v2 -next] misc: ocxl: use DEFINE_MUTEX() for mutex lock
Message-Id: <161235199985.1516112.15428721712671016806.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:51 +1100 (AEDT)
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
Cc: fbarrat@linux.ibm.com, gregkh@linuxfoundation.org, ajd@linux.ibm.com,
 arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Dec 2020 21:24:46 +0800, Zheng Yongjun wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().

Applied to powerpc/next.

[1/1] ocxl: use DEFINE_MUTEX() for mutex lock
      https://git.kernel.org/powerpc/c/52f6b0a90bcf573ba8a33e97544c7b6f292376a4

cheers
