Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B742921478E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 18:52:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49zdCx0tHRzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 02:52:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49zd8n4gjlzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jul 2020 02:49:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49zd8X45wzz9tyNd;
 Sat,  4 Jul 2020 18:49:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6A-LboEen77o; Sat,  4 Jul 2020 18:49:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49zd8X2Py1z9tyNc;
 Sat,  4 Jul 2020 18:49:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C8698B780;
 Sat,  4 Jul 2020 18:49:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LdNBUEYla3iI; Sat,  4 Jul 2020 18:49:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D6ACD8B75B;
 Sat,  4 Jul 2020 18:49:17 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Looking for guidance for porting home made audio driver to ASoC/FSL
To: Qiang Zhao <qiang.zhao@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Li Yang <leoyang.li@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Message-ID: <d27d50d0-f99a-7702-4175-79281b06ad8c@csgroup.eu>
Date: Sat, 4 Jul 2020 18:49:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: TIGE Jean-Paul <jean-paul.tige@csgroup.eu>,
 "F. TRINH THAI" <florent.trinh-thai@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello

I'm looking for guidance for porting a home made audio driver to 
ASoC/FSL on a custom board.

The board has an MPC8321 freescale/NXP cpu. The board has a TDM bus 
connected to one of the cpu TDM port. On that TDM bus, there are three 
IDT 821034 quad codecs (PCM G.711) and an E1 chip that carries IP over E1.

Today, there is a home made audio driver providing raw read/write 
devices plus an home made WAN HDLC driver for the E1.

The CPU Quicc Engine (QE) is configured to connect the TDM port to one 
UCC. QUICC Multi-Channel Controller (QMC) is used to distribute E1 
timeslots to the HDLC driver and each of the 12 codec timeslots to the 
audio driver. (The QMC is able to manage two types of channels: 
transparent and HDLC).

We would like to make all this more standard and port it to use ALSA 
ASoC for the audio part, and the Freescale Quicc Engine HDLC. As of 
today, the Freescale QE HDLC wan driver uses the UCC directly, it 
doesn't interface through the QMC. And the FSL ASoC drivers seem to 
neither handle QE TDM via QE QMC nor QE UCC.

We are thinking about adding a QE QMC layer in driver/soc/fsl/ which 
would more or less present to the consumer the same kind of API as the 
FSL UCC layer, and enhance the WAN FSL HDLC driver to be able to use 
that new layer.

For the ALSA ASoC part, could some parts of existing FSL ASoC drivers be 
re-used of would we have to start implementing an ASoC from scratch ?

Any recommendation and/or guidance would be welcomed and appreciated.

Thanks in advance
Christophe
