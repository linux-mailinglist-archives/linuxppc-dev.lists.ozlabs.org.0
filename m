Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F014D42DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 09:51:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDjVJ4qCrz3073
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 19:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDjTq6n8Qz2yhC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 19:51:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDjTh6gGcz9sRr;
 Thu, 10 Mar 2022 09:51:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KN9tQPs5Z3VJ; Thu, 10 Mar 2022 09:51:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDjTX53tRz9sS1;
 Thu, 10 Mar 2022 09:51:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CB5C8B780;
 Thu, 10 Mar 2022 09:51:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9ky5aI1uLoWU; Thu, 10 Mar 2022 09:51:12 +0100 (CET)
Received: from [192.168.202.40] (unknown [192.168.202.40])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15CFE8B763;
 Thu, 10 Mar 2022 09:51:12 +0100 (CET)
Message-ID: <f55dba9c-f00f-3aa9-d84d-1cda2b660dcb@csgroup.eu>
Date: Thu, 10 Mar 2022 09:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] powerpc/eeh: Use pcie_reset_state_t type in function
 arguments
Content-Language: fr-FR
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20210713002525.203840-1-kw@linux.com>
 <20210713002525.203840-2-kw@linux.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210713002525.203840-2-kw@linux.com>
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
Cc: linux-pci@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/07/2021 à 02:25, Krzysztof Wilczyński a écrit :
> The pcie_reset_state_t type has been introduced in the commit
> f7bdd12d234d ("pci: New PCI-E reset API") along with the enum
> pcie_reset_state, but it has never been used for anything else
> other than to define the members of the enumeration set in the
> enum pcie_reset_state.
> 
> Thus, replace the direct use of enum pcie_reset_state in function
> arguments and replace it with pcie_reset_state_t type so that the
> argument type matches the type used in enum pcie_reset_state.
> 
> Signed-off-by: Krzysztof Wilczyński <kw@linux.com>

I don't understand the purpose of this change. Does any tool like sparse 
of so reports an error here ?

My feeling is that by doing this you loose the added value of using an 
enumerate.

state is used in a switch/case, that's exactly what we expect from an enum.

By the way, I think you can't change the prototype of a weak function in 
a patch and not change it at the same time for the overloading function.

So should you still think this change is necessary, I think patch 1 and 
2 should be squashed together in one.

Christophe


> ---
>   arch/powerpc/kernel/eeh.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 3bbdcc86d01b..15485abb89ff 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -714,7 +714,7 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
>    * Return value:
>    * 	0 if success
>    */
> -int pcibios_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state state)
> +int pcibios_set_pcie_reset_state(struct pci_dev *dev, pcie_reset_state_t state)
>   {
>   	struct eeh_dev *edev = pci_dev_to_eeh_dev(dev);
>   	struct eeh_pe *pe = eeh_dev_to_pe(edev);
