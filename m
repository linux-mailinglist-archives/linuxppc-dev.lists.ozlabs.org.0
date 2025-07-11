Return-Path: <linuxppc-dev+bounces-10182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9FB01302
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 07:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdgpl6WxRz30Vb;
	Fri, 11 Jul 2025 15:52:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752213151;
	cv=none; b=oSncTq9M2P3DJow3gMAvRm+ly2B0NpIVomUmYLE74pkEdBPorEwbDICBOuze7l637d44M2TjSPfGVjiVgXl++YjMh++hGa/lXzSTz80rZhJ3cBNVrtFrhQ5y0DwMNTZWHuW0IYFmWT0OLgIvEdY273SkMN0uh7QC7OdlYSlpge12/WU0PcfsQID/G4RN1p35XsPzjHDJZCyy1Ru4bNjQ8NaaH52gRtmU8yHSfsIm6S6xNmu/lW2BwD1/CHfDkbb1Imoj63b/VnEZ+xjO0YuZWF3i18zLeD3aGICiEAWaM5aQ0eIW6VPKbBI/zGEAz2HutpjVMS81po5+MyK7E83DrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752213151; c=relaxed/relaxed;
	bh=Icw7wkKwvxZifVMtVPGHXFge40EL5tpFT2bqMuSRgPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l15llrbo1wpKpfeWsHObESvEVtMfsdBBRoqptkYWXeY2qa6USFE1wZeoQbjzI4b3e7UIhaKbk/fDZXaeEx1bD1/W/PVu7dJiEv5K91lGtEwtYYMTTWI4nW6qy2V+WM73ah/CG8vYQ35qmsy6n9eyPlFDDiYOGb1l+PrabbeHL7CeV0PtJmMvpWymwR6p935AeF4B/bZmO8n5a9K4HYMRLiORORMGuu6v3Q4FJMraWAsGsjAoXXTSoxpP7So/cKfIlFDvQiUI44YUSOpmUPs8115Sd2sdYyaKI6nIUNf0NJc/zkozehy+NWgKw5KXK+0aOben0cbb5bceoC00NsVxkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XvigZfao; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XvigZfao;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdgpk5Hszz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 15:52:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 420784428F;
	Fri, 11 Jul 2025 05:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C586CC4CEED;
	Fri, 11 Jul 2025 05:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752213148;
	bh=GalF7X4tEOCU7yqLuZS+dTBOvpTY6VBkPegdXd1d4f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvigZfaoKZQ1bTxPtiORTiC85gXzd7tvxH+bBbT6xdC5Dm8qzEeu+78cq1NEYb/HN
	 +LACQR7M0dZLheoogtIyhwfRCGfg2TKue6huk8v+TF/E1FKehTN2IVlHlG7CAcSSnG
	 Kg14u4UgHAE98ZoySQ0BTj+JkJEF0HYTZZH92kIk=
Date: Fri, 11 Jul 2025 07:52:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <2025071125-talon-clammy-4971@gregkh>
References: <20250711053509.194751-1-thuth@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711053509.194751-1-thuth@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 07:35:09AM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The FSF does not reside in the Franklin street anymore. Let's update
> the address with the link to their website, as suggested in the latest
> revision of the GPL-2.0 license.
> (See https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt for example)
> 
> Acked-by: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Resend with CC: linux-spdx@vger.kernel.org as suggested here:
>      https://lore.kernel.org/linuxppc-dev/e5de8010-5663-47f4-a2f0-87fd88230925@csgroup.eu
>      
>  arch/powerpc/boot/crtsavres.S            | 5 ++---
>  arch/powerpc/include/uapi/asm/eeh.h      | 5 ++---
>  arch/powerpc/include/uapi/asm/kvm.h      | 5 ++---
>  arch/powerpc/include/uapi/asm/kvm_para.h | 5 ++---
>  arch/powerpc/include/uapi/asm/ps3fb.h    | 3 +--
>  arch/powerpc/lib/crtsavres.S             | 5 ++---
>  arch/powerpc/xmon/ppc.h                  | 5 +++--
>  7 files changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/boot/crtsavres.S b/arch/powerpc/boot/crtsavres.S
> index 085fb2b9a8b89..a710a49a5dbca 100644
> --- a/arch/powerpc/boot/crtsavres.S
> +++ b/arch/powerpc/boot/crtsavres.S
> @@ -26,9 +26,8 @@
>   * General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License
> - * along with this program; see the file COPYING.  If not, write to
> - * the Free Software Foundation, 51 Franklin Street, Fifth Floor,
> - * Boston, MA 02110-1301, USA.
> + * along with this program; see the file COPYING.  If not, see
> + * <https://www.gnu.org/licenses/>.
>   *
>   *    As a special exception, if you link this library with files
>   *    compiled with GCC to produce an executable, this does not cause

Please just drop all the "boilerplate" license text from these files,
and use the proper SPDX line at the top of them instead.  That is the
overall goal for all kernel files.

thanks,

greg k-h

