Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E6E59F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 13:22:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470drJ3MZtzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 22:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="VMwHltKJ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470dn96jTPzDq74
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 22:20:12 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 470dn23HVBz9vBLY;
 Sat, 26 Oct 2019 13:20:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VMwHltKJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8T8h_3sGDPZb; Sat, 26 Oct 2019 13:20:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 470dn223dkz9vBLX;
 Sat, 26 Oct 2019 13:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572088806; bh=cuRzeOKlaXy8moZYsilOlogmoVgTxTKDrbJaqzMZyMA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VMwHltKJYJQdbu7PK4+xV1Dr9Besk731Q47erS5k6wafk2Ix2XG/xyFnG7Pvv7Pg5
 SmFst9LS0rBqSvgtCWvAXLp7a5kvYO+9pNHWnD2vz3j6KcChDoxTB+LhKcXRTo1trv
 k1eZFRaooVdUouwfdY+ERrKOEab8qufUfRYCusww=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F33F8B7A8;
 Sat, 26 Oct 2019 13:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F8WsoAjdIp8i; Sat, 26 Oct 2019 13:20:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD48D8B787;
 Sat, 26 Oct 2019 13:20:06 +0200 (CEST)
Subject: Re: loop nesting in alignment exception and machine check
To: "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <D44062DC474617438D5181ADFE2B2C21016DE42A@dggemi529-mbs.china.huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8215aeb3-57dd-223a-29d3-45ca22b0543c@c-s.fr>
Date: Sat, 26 Oct 2019 13:20:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <D44062DC474617438D5181ADFE2B2C21016DE42A@dggemi529-mbs.china.huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "chengjian \(D\)" <cj.chengjian@huawei.com>, Xiexiuqi <xiexiuqi@huawei.com>,
 "alistair@popple.id.au" <alistair@popple.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "oss@buserror.net" <oss@buserror.net>, "paulus@samba.org" <paulus@samba.org>,
 "Libin \(Huawei\)" <huawei.libin@huawei.com>, "agust@denx.de" <agust@denx.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 26/10/2019 � 09:23, Wangshaobo (bobo) a �crit�:
> Hi,
> 
> I encountered a problem about a loop nesting occurred in manufacturing 
> the alignment exception in machine check, trigger background is :
> 
> problem:
> 
> machine checkout or critical interrupt ->�->kbox_write[for recording 
> last words] -> memcpy(irremap_addr, src,size):_GLOBAL(memcpy)�
> 
> when we enter memcpy,a command �dcbz r11,r6� will cause a alignment 
> exception, in this situation,r11 loads the ioremap address,which leads 
> to the alignment exception,

You can't use memcpy() on something else than memory.

For an ioremapped area, you have to use memcpy_toio()

Christophe

> 
> then the command can not be process successfully,as we still in machine 
> check.at the end ,it triggers a new irq machine check in irq handler 
> function,a loop nesting begins.
> 
> analysis:
> 
> We have analysed a lot,but it still can not come to a reasonable 
> description,in common,the alignment triggered in machine check context 
> can still be collected into the Kbox
> 
> after alignment exception be handled by handler function, but how does 
> the machine checkout can be triggered in the handler fucntion for any 
> causes? We print relevant registers
> 
> as follow when first enter machine check and alignment exception handler 
> function:
> 
>  �������� MSR:0x2����� MSR:0x0
> 
>  �������� SRR1:0x2����� SRR1:0x21002
> 
>  �������� But the manual says SRR1 should be set to MSR(0x2),why that 
> happened ?
> 
>  �������� Then a branch in handler function copy the SRR1 to MSR,this 
> enble MSR[ME] and MSR[CE],system collapses.
> 
> Conclusion:
> 
>  �������� 1)� why the alignment exception can not be handled in machine 
> check ?
> 
>  �������� 2)� besides memcpy,any other function can cause the alignment 
> exception ?
> 
> We still recurrent it, the line as follows:
> 
>  �������� Cpu dead lock->watch log->trigger 
> fiq->kbox_write->memcpy->alignment exception->print last words.
> 
>  �������� but for those problems as below,what the kbox printed is empty.
> 
> ------------------kbox restart:[�� 10.147594]----------------
> 
> kbox verify fs magic fail
> 
> kbox mem mabye destroyed, format it
> 
> kbox: load OK
> 
> lock-task: major[249] minor[0]
> 
> -----start show_destroyed_kbox_mem_head----
> 
> 00000000: 00000000 00000000 00000000 00000000� ................
> 
> 00000010: 00000000 00000000 00000000 00000000� ................
> 
> 00000020: 00000000 00000000 00000000 00000000� ................
> 
> 00000030: 00000000 00000000 00000000 00000000� ................
> 
> 00000040: 00000000 00000000 00000000 00000000� ................
> 
> 00000050: 00000000 00000000 00000000 00000000� ................
> 
> 00000060: 00000000 00000000 00000000 00000000� ................
> 
> 00000070: 00000000 00000000 00000000 00000000� ................
> 
> 00000080: 00000000 00000000 00000000 00000000� ................
> 
> 00000090: 00000000 00000000 00000000 00000000� ................
> 
