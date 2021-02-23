Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 041D9323373
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 22:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlXlc6tBSz3cMR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 08:50:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AEffIJdz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.160;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=AEffIJdz; 
 dkim-atps=neutral
X-Greylist: delayed 179 seconds by postgrey-1.36 at boromir;
 Wed, 24 Feb 2021 08:49:38 AEDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlXl656SDz30M2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 08:49:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1614116612; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Rsrik6EYfnGUNdE2cMiXfc7K8yU/AeKiVfqEW9wW+sYXY6DTRtY0LZhtC7PAgpnHMS
 NXpO5SZIcCvuFhooORmqOc/yYdc8J7pdLqlz5dSCKEGHx0Ac4x5MHt0bsy8jeq1We4cl
 /xHLtmicHNRKPwe2dZ1gmgj2VFNEGctsxjO1Pwc7BkZumlD8MlbTFylJeAIc1GJlxRXv
 mwW8Tvr210yH+T1SypU5I8ZjzYuXdo562m6QAnzcZRywBIk2EWitnn+2WBHnLdZKMZ3R
 Zi0h4WPznBFS/CCUSNgSjiHQh6zCbUmFMYF2vrdyftzl4NpoGY8QKgIfcdy2dLLExm1l
 jdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614116612;
 s=strato-dkim-0002; d=strato.com;
 h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
 bh=sIFsuj6ndB/eY5EYdZCIaBSgFWXVLX69T7Jg0ezE3Qg=;
 b=AssERzsTMLJgqzTtxbPDiziQONm0U6huiKLhefZ9p7uzYjZZHWHRHixeMw8YeZUzQF
 B/xe/5hZWe/rHT9Ij2rogM5fn5Iv/0YNynIpGj65ZuAs6E4C9FKTP/of64uMC/En8X9s
 XqTwPI52nduP54YVO7iMTO5ZjOZWYeP9f8vMqB9McDrEZLK+MvVdeNOk5Sd4WGuR06yy
 XEsfyPavXvXvkvY2JdMJRkJ1BRO0Fi9h3w0PmbfW38J1gliIODrq0Z+WXFbinwpipVxC
 3aA60VKqmrGpLW/rudi/ggyt+1WGTMjZ8fajrhzIaIiQIEoktdLP5kgfDhpFrosr0swX
 zMkQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614116612;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
 bh=sIFsuj6ndB/eY5EYdZCIaBSgFWXVLX69T7Jg0ezE3Qg=;
 b=AEffIJdz9MD251MvKEP44Y148hvU15hx538/trxQethpF13LWLZ4i2MBTKdCa1DYdu
 pZAHgBCc26ok5cxLUoQiVriAd/CtQ2Sbx2iIjHEfSokC/RvOtBQoGxOM96z6+IiNuY5g
 kCMzX+4ejD1phAR3VIoLcFks0LegWAsFzbncVTqh5HmSv+lMkAGyXmtm6g6NgrDmHVVJ
 uytrXQwaoalvyiRFe/w5d73Sb14U5TAqTGIn4j1Q8QlUVT0gHA4SQDE5semVhhcwAaud
 8SwfjCgdW/+TjoTj1k9X0CwqATDO78GmYtzGnZL44bmSiE2QJZ49ZAbQxMkv3zQF7g1b
 sJMg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZUhNnB7hxZBUO5/LxRSnAm5zTx20DeqrVLPf4o="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a90a:a984:8095:e6fe:bae:68f7]
 by smtp.strato.de (RZmta 47.19.0 AUTH)
 with ESMTPSA id a070ddx1NLhUCQb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 23 Feb 2021 22:43:30 +0100 (CET)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Olof Johansson <olof@lixom.net>, Michael Ellerman <mpe@ellerman.id.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PASEMI] Nemo board doesn't boot anymore because of moving
 pas_pci_init
Message-ID: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
Date: Tue, 23 Feb 2021 22:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

The Nemo board [1] with a P.A. Semi PA6T SoC doesn't boot anymore 
because of moving "pas_pci_init" to the device tree adoption [2] in the 
latest PowerPC updates 5.12-1 [3].

Unfortunately the Nemo board doesn't have it in its device tree. I 
reverted this commit and after that the Nemo board boots without any 
problems.

What do you think about this ifdef?

#ifdef CONFIG_PPC_PASEMI_NEMO
         /*
          * Check for the Nemo motherboard here, if we are running on one
          * then pas_pci_init()
          */
         if (of_machine_is_compatible("pasemi,nemo")) {
                 pas_pci_init();
         }
#endif

Thanks,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/arch/powerpc/platforms/pasemi/setup.c?id=b12b47249688915e987a9a2a393b522f86f6b7ab
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b12b47249688915e987a9a2a393b522f86f6b7ab
