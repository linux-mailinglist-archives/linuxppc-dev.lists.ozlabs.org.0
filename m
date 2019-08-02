Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D537F7E2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:10:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460SFC3pBxzDq8W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 23:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460RHG1TFlzDqyj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 22:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 460RHF4fMDz9sBF;
 Fri,  2 Aug 2019 22:26:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leonardo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] pseries/hotplug-memory.c: Replace nested ifs by
 switch-case
In-Reply-To: <20190801225251.17864-1-leonardo@linux.ibm.com>
References: <20190801225251.17864-1-leonardo@linux.ibm.com>
Date: Fri, 02 Aug 2019 22:26:48 +1000
Message-ID: <87sgqjkb1z.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Leonardo Bras <leonardo@linux.ibm.com> writes:
> I noticed these nested ifs can be easily replaced by switch-cases,
> which can improve readability.
>
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  .../platforms/pseries/hotplug-memory.c        | 26 +++++++++++++------
>  1 file changed, 18 insertions(+), 8 deletions(-)

Thanks, this looks sensible.

Please use "powerpc/" as the prefix on your patches, eg. in this case:

"powerpc/pseries/hotplug-memory.c: Replace nested ifs by switch-case"

I'll fix it up this time when I apply.

cheers

> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 46d0d35b9ca4..8e700390f3d6 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -880,34 +880,44 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
>  
>  	switch (hp_elog->action) {
>  	case PSERIES_HP_ELOG_ACTION_ADD:
> -		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT) {
> +		switch (hp_elog->id_type) {
> +		case PSERIES_HP_ELOG_ID_DRC_COUNT:
>  			count = hp_elog->_drc_u.drc_count;
>  			rc = dlpar_memory_add_by_count(count);
> -		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
> +			break;
> +		case PSERIES_HP_ELOG_ID_DRC_INDEX:
>  			drc_index = hp_elog->_drc_u.drc_index;
>  			rc = dlpar_memory_add_by_index(drc_index);
> -		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_IC) {
> +			break;
> +		case PSERIES_HP_ELOG_ID_DRC_IC:
>  			count = hp_elog->_drc_u.ic.count;
>  			drc_index = hp_elog->_drc_u.ic.index;
>  			rc = dlpar_memory_add_by_ic(count, drc_index);
> -		} else {
> +			break;
> +		default:
>  			rc = -EINVAL;
> +			break;
>  		}
>  
>  		break;
>  	case PSERIES_HP_ELOG_ACTION_REMOVE:
> -		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT) {
> +		switch (hp_elog->id_type) {
> +		case PSERIES_HP_ELOG_ID_DRC_COUNT:
>  			count = hp_elog->_drc_u.drc_count;
>  			rc = dlpar_memory_remove_by_count(count);
> -		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
> +			break;
> +		case PSERIES_HP_ELOG_ID_DRC_INDEX:
>  			drc_index = hp_elog->_drc_u.drc_index;
>  			rc = dlpar_memory_remove_by_index(drc_index);
> -		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_IC) {
> +			break;
> +		case PSERIES_HP_ELOG_ID_DRC_IC:
>  			count = hp_elog->_drc_u.ic.count;
>  			drc_index = hp_elog->_drc_u.ic.index;
>  			rc = dlpar_memory_remove_by_ic(count, drc_index);
> -		} else {
> +			break;
> +		default:
>  			rc = -EINVAL;
> +			break;
>  		}
>  
>  		break;
> -- 
> 2.20.1
