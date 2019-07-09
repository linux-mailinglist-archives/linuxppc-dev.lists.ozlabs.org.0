Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B161637FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 16:34:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jlFj5xsVzDqXd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 00:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jlCq46nPzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:32:55 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9E60368B05; Tue,  9 Jul 2019 16:32:51 +0200 (CEST)
Date: Tue, 9 Jul 2019 16:32:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Max Gurtovoy <maxg@mellanox.com>
Subject: Re: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Message-ID: <20190709143251.GA3222@lst.de>
References: <20190426124917.23789-1-hch@lst.de>
 <20190426124917.23789-2-hch@lst.de>
 <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
 <20190523075253.GA12946@lst.de>
 <AM0PR05MB5810FF3B4A45B3CA722489EEB6F10@AM0PR05MB5810.eurprd05.prod.outlook.com>
 <20190709135935.GA2511@lst.de>
 <ec1f8638-d97d-bfc7-23e1-9af555654562@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec1f8638-d97d-bfc7-23e1-9af555654562@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>,
 Shlomi Nimrodi <shlomin@mellanox.com>, Paul Mackerras <paulus@samba.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oren Duer <oren@mellanox.com>,
 Idan Werpoler <Idanw@mellanox.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2019 at 05:31:37PM +0300, Max Gurtovoy wrote:
> Are we ok with working on a solution during kernel-5.3 cycle ?

You can start working on it any time, no need to ask for permission.
