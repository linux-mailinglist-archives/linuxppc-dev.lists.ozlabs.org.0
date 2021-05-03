Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D037221B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 22:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYwHV2Bskz3048
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 06:56:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=mail.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
X-Greylist: delayed 488 seconds by postgrey-1.36 at boromir;
 Tue, 04 May 2021 06:55:47 AEST
Received: from mail.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYwH72CCWz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 06:55:46 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id E816A4D25963D;
 Mon,  3 May 2021 13:47:21 -0700 (PDT)
Date: Mon, 03 May 2021 13:47:21 -0700 (PDT)
Message-Id: <20210503.134721.2149322673805635760.davem@davemloft.net>
To: lijunp213@gmail.com
Subject: Re: [PATCH] ibmvnic: remove default label from to_string switch
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAOhMmr701LecfuNM+EozqbiTxFvDiXjFdY2aYeKJYaXq9kqVDg@mail.gmail.com>
References: <20210503102323.17804-1-msuchanek@suse.de>
 <CAOhMmr701LecfuNM+EozqbiTxFvDiXjFdY2aYeKJYaXq9kqVDg@mail.gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Mon, 03 May 2021 13:47:22 -0700 (PDT)
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
Cc: sukadev@linux.ibm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 tlfalcon@linux.ibm.com, paulus@samba.org, drt@linux.ibm.com, kuba@kernel.org,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lijun Pan <lijunp213@gmail.com>
Date: Mon, 3 May 2021 13:21:00 -0500

> On Mon, May 3, 2021 at 5:54 AM Michal Suchanek <msuchanek@suse.de> wrote:
>>
>> This way the compiler warns when a new value is added to the enum but
>> not the string transation like:
> 
> s/transation/translation/
> 
> This trick works.
> Since the original code does not generate gcc warnings/errors, should
> this patch be sent to net-next as an improvement?

Yes.
