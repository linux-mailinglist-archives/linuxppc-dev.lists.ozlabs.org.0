Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807CC65AA2B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Jan 2023 15:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NlLjg2dgrz3c79
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 01:19:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gqApt0UQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gqApt0UQ;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NlLhg0CS3z3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jan 2023 01:18:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672582707;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Cc:Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=8f/CsVN3qKVqZ50fwefsRSaF5UOB0GeYfLvYj1dUpWo=;
    b=gqApt0UQw6hDFn+wuLMG5Yz7s4dEubtYJQ/Wm2iiGJcPyhymQVFsdJj477AFl/VFny
    C/C4/frDh7Y4EuhILcukinG08JjvEyTMSxBNev54G70Uaw11UcVk3NIkynu4kSpCVQIA
    fd6LqpmnjR8ejgKWSrD+NRuyxcuM5V5YathoS1A9HHZA63cyEfaH/9A/DPPVK2GhasBR
    EVXtAW9Stjxn0Z10T9/TOiRvMAROS6HJ1AhuenqPyUKIM/8ChII3DKs7hglQEuS6yI9l
    BnuRejFljqh3le48BD4jUQYvJnbQJWRHKcT2h0UCy9m1KCG10fpgs1vYd5E3B+J04w8B
    1dOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjW6EVVaVDecihpMDoQ196V/fExeQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:31b5:1504:1cd5:9147]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdz01EIQEjp
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 1 Jan 2023 15:18:26 +0100 (CET)
Message-ID: <0bfc8f3d-cb62-25f4-2590-ff424adbe48a@xenosoft.de>
Date: Sun, 1 Jan 2023 15:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: sean.anderson@seco.com, davem@davemloft.net,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Matthew Leaman <matthew@a-eon.biz>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [FSL P50x0] DPAA Ethernet issue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The DPAA Ethernet doesn’t work anymore on our FSL P5020/P5040 boards [1] 
since the first updates after the final kernel 6.1 [2].
We bisected yesterday [3] and found the problematic commit [4]. I was 
able to revert it. After that the DPAA Ethernet works again. I created a 
patch for reverting the commit [4]. After patching and compiling, the 
DPAA Ethernet also works again.

It seems, that the new driver doesn’t work with our onboard DPAA network 
interfaces.

Could you please check your commit? [4]

Thanks,
Christian

[1] http://wiki.amiga.org/index.php?title=X5000
[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=56326#p56326
[3] https://forum.hyperion-entertainment.com/viewtopic.php?p=56334#p56334
[4] lnet: dpaa: Convert to phylink: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.1&id=5d93cfcf7360eac9903774fe94f626c9ead2049d
