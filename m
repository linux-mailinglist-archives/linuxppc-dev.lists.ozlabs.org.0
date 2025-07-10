Return-Path: <linuxppc-dev+bounces-10176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC6B00A0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 19:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdMYF04vVz2yGM;
	Fri, 11 Jul 2025 03:39:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752169184;
	cv=none; b=cygHZoe4nRor5vd7qvc/C/H/wk1dWt9NSBTfvFjgy3kUH3sdH8kAgTSeW37n5qb63JBauMb71w0hLkV3EWmsWKnQKEuppnA6XKCNSxswN25BDVbdBI+rdZKti2hbNHUidJU2KRoicW2J565LA2YjfL945b9v0xM6StazJubveUW4fNpNTahgx59g8uZsKKRFuyV7SnJ93z0B1t17lWEzQWvvO5R+aeo0QUmhTq1tIl31gbw/hkI2FWuli17VifsqsGgATVpJx3DUjHLPMwHN9bGgwjE7rPIi+vxYroxncID4Clf1T9pdYCKh2VvPES2wt+PZcu3i7J0xpybHSe4CXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752169184; c=relaxed/relaxed;
	bh=bLNIaDyGM9rnvMi133LnW4zAm3fYtu92++100WQaDjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmdRAVMjkhg2V52FgwizUsKBdzZ+Jvfjazd5wczeHs3IS63PvF/fIEBnduHNXF7oO1RKWk7KJWTopQc2OMdcEU+uHOgbBrAuLi5hYVT1zWnxEP15+UoyHP+aw0FTgmym2jMT8WYYuqZarXAkQeepRg/TylBYA0QtaNnOrhB5q3KItRM7VtJRbtrhEO6ScBxNhiT+wxRWvJ7B47NqcyX7N761QQC+EFqwk1pUL1zRQE7/iika8UJYN6x+Y0EWwSxf369K16fCD61okBQt60rixV8FYI0+qY3YFPkLXEaCY33tMvJPvrZ/VZP+O0FI4m14Ok+zELXq5r6nD8RKadk/5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdMYC58dbz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 03:39:42 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 56AHdJKS508082;
	Thu, 10 Jul 2025 12:39:19 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 56AHdDIB508074;
	Thu, 10 Jul 2025 12:39:13 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 10 Jul 2025 12:39:13 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Subject: Re: [PATCH] powerpc: Replace the obsolete address of the FSF
Message-ID: <aG_6wcivy5-0oiyB@gate>
References: <20250710121657.169969-1-thuth@redhat.com>
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
In-Reply-To: <20250710121657.169969-1-thuth@redhat.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 10, 2025 at 02:16:57PM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The FSF does not reside in the Franklin street anymore. Let's update
> the address with the link to their website, as suggested in the latest
> revision of the GPL-2.0 license.
> (See https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt for example)

That looks good, this is indeed the newer GPLv2 text.

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

> diff --git a/arch/powerpc/boot/crtsavres.S b/arch/powerpc/boot/crtsavres.S
Segher


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
> diff --git a/arch/powerpc/include/uapi/asm/eeh.h b/arch/powerpc/include/uapi/asm/eeh.h
> index 28186071fafc4..4a117cc475299 100644
> --- a/arch/powerpc/include/uapi/asm/eeh.h
> +++ b/arch/powerpc/include/uapi/asm/eeh.h
> @@ -9,9 +9,8 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <https://www.gnu.org/licenses/>.
>   *
>   * Copyright IBM Corp. 2015
>   *
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
> index eaeda001784eb..75c1d7a48ad52 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -9,9 +9,8 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <https://www.gnu.org/licenses/>.
>   *
>   * Copyright IBM Corp. 2007
>   *
> diff --git a/arch/powerpc/include/uapi/asm/kvm_para.h b/arch/powerpc/include/uapi/asm/kvm_para.h
> index a809b1b44ddfe..66d1e17e427a6 100644
> --- a/arch/powerpc/include/uapi/asm/kvm_para.h
> +++ b/arch/powerpc/include/uapi/asm/kvm_para.h
> @@ -9,9 +9,8 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <https://www.gnu.org/licenses/>.
>   *
>   * Copyright IBM Corp. 2008
>   *
> diff --git a/arch/powerpc/include/uapi/asm/ps3fb.h b/arch/powerpc/include/uapi/asm/ps3fb.h
> index fd7e3a0d35d57..af6322042b3b0 100644
> --- a/arch/powerpc/include/uapi/asm/ps3fb.h
> +++ b/arch/powerpc/include/uapi/asm/ps3fb.h
> @@ -13,8 +13,7 @@
>   * General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write to the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + * with this program; if not, see <https://www.gnu.org/licenses/>.
>   */
>  
>  #ifndef _ASM_POWERPC_PS3FB_H_
> diff --git a/arch/powerpc/lib/crtsavres.S b/arch/powerpc/lib/crtsavres.S
> index 8967903c15e99..c7e58b6614169 100644
> --- a/arch/powerpc/lib/crtsavres.S
> +++ b/arch/powerpc/lib/crtsavres.S
> @@ -27,9 +27,8 @@
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
> diff --git a/arch/powerpc/xmon/ppc.h b/arch/powerpc/xmon/ppc.h
> index 1d98b8dd134ef..270097f6e905b 100644
> --- a/arch/powerpc/xmon/ppc.h
> +++ b/arch/powerpc/xmon/ppc.h
> @@ -15,8 +15,9 @@ warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>  the GNU General Public License for more details.
>  
>  You should have received a copy of the GNU General Public License
> -along with this file; see the file COPYING.  If not, write to the Free
> -Software Foundation, 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.  */
> +along with this file; see the file COPYING.  If not, see
> +<https://www.gnu.org/licenses/>.
> +*/
>  
>  #ifndef PPC_H
>  #define PPC_H
> -- 
> 2.50.0
> 

